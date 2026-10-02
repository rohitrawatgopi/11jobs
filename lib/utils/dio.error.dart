import 'package:dio/dio.dart';

class AppDioErrorHandler {
  static String getErrorMessage(DioException error) {
    // 🔥 SERVER RESPONSE FIRST
    if (error.response != null) {
      final data = error.response!.data;

      if (data is Map && data['message'] != null) {
        return data['message'];
      }

      switch (error.response!.statusCode) {
        case 401:
          return 'Session expired. Please login again.';
        case 403:
          return 'You are not authorized to perform this action.';
        case 404:
          return 'Requested resource not found.';
        case 500:
          return 'Server error. Please try again later.';
      }
    }

    // 🌐 NETWORK ISSUES
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out.';
      case DioExceptionType.receiveTimeout:
        return 'Server not responding.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      case DioExceptionType.cancel:
        return 'Request cancelled.';
      default:
        return 'Unexpected error occurred.';
    }
  }
}
