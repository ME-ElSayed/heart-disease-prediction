import 'package:dio/dio.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static String handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    return 'An unexpected error occurred. Please try again.';
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timed out. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond. Please try again.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  static String _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check your input data.';
      case 422:
        return 'Validation error. Please ensure all fields are filled correctly.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Something went wrong (Error $statusCode).';
    }
  }
}
