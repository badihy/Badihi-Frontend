import 'package:badihi/core/api/end_points.dart';
import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:dio/dio.dart';

// Observe each request
class ApiInterceptor extends Interceptor {
  static CancelToken cancelToken = CancelToken(); // Add a CancelToken

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   options.headers = {
  //     "Authorization":
  //         "Bearer ${getIt<CacheHelper>().getString(ApiKey.token) != null ? "${getIt<CacheHelper>().getString(ApiKey.token)}" : null}",
  //   };
  //   // Attach CancelToken to each request
  //   options.cancelToken = cancelToken; // Attach the cancel token to requests

  //   super.onRequest(options, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.cancel) {
      // print("Request was cancelled"); => Handle the exception
    }
    super.onError(err, handler);
  }

  // Function to cancel requests
  static void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("Request cancelled by user");
      cancelToken = CancelToken(); // Reset the token for future requests
    }
  }
}
