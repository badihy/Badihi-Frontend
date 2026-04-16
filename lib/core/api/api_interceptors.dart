import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends Interceptor {
  static CancelToken cancelToken = CancelToken();

  final Dio dio;

  ApiInterceptor(this.dio);

  bool isRefreshing = false;

  final List<_PendingRequest> requestQueue = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = getIt<CacheHelper>().getString(ApiKey.token);

    // Skip attaching token for refresh endpoint
    if (options.path != EndPoints.refreshToken) {
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }
    }

    options.cancelToken = cancelToken;

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // Prevent infinite loop
    if (requestOptions.path == EndPoints.refreshToken) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      // If already refreshing → queue requests
      if (isRefreshing) {
        requestQueue.add(_PendingRequest(requestOptions, handler));
        return;
      }

      isRefreshing = true;

      try {
        final newAccessToken = await _refreshToken();

        // Retry original request
        requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

        final response = await dio.fetch(requestOptions);

        // Retry all queued requests
        for (var pending in requestQueue) {
          pending.options.headers["Authorization"] = "Bearer $newAccessToken";

          final res = await dio.fetch(pending.options);
          pending.handler.resolve(res);
        }

        requestQueue.clear();

        handler.resolve(response);
      } catch (e) {
        // Refresh failed → logout
        await _logout();

        // Reject all queued requests
        for (var pending in requestQueue) {
          pending.handler.reject(err);
        }

        requestQueue.clear();

        handler.reject(err);
      } finally {
        isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  // Refresh token logic
  Future<String> _refreshToken() async {
    final refreshToken = getIt<CacheHelper>().getString(ApiKey.refreshToken);

    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception("No refresh token found");
    }

    // Separate Dio (IMPORTANT)
    final refreshDio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));

    final response = await refreshDio.get(
      EndPoints.refreshToken,
      options: Options(
        headers: {
          "Authorization": "Bearer $refreshToken",
        },
      ),
    );

    final newAccessToken = response.data["data"]["token"];
    final newRefreshToken = response.data["data"]["refreshToken"];

    if (newAccessToken == null || newRefreshToken == null) {
      throw Exception("Invalid refresh response");
    }

    await getIt<CacheHelper>().setString(ApiKey.token, newAccessToken);
    await getIt<CacheHelper>().setString(ApiKey.refreshToken, newRefreshToken);

    return newAccessToken;
  }

  Future<void> _logout() async {
    await getIt<CacheHelper>().clearUserData();
  }

  static void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("Request cancelled by user");
      cancelToken = CancelToken();
    }
  }
}

// Helper class for queued requests
class _PendingRequest {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  _PendingRequest(this.options, this.handler);
}
