import 'package:badihy/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errModel;
  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request => User not found
        case 401: // Unauthorized
        case 403: // Forbidden
        case 404: // Not found
        case 409: // Conflict
        case 422: // Unprocessable Entity
        case 504: // Server exception
          throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
