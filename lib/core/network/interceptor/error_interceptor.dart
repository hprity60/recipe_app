import 'dart:io';
import 'package:dio/dio.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    late String errorMessage;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        (err.error.toString())
            .contains("Connection timeout. Please try again later.")) {
      errorMessage = "Connection timeout. Please try again later.";
    } else if (err.type == DioExceptionType.badResponse) {
      if (err.response != null &&
          err.response!.statusCode == HttpStatus.badRequest) {
        try {
          final Map<String, dynamic>? errorResponse = err.response!.data;
          if (errorResponse != null && errorResponse.containsKey("message")) {
            final String originalErrorMessage =
                errorResponse["message"].toString();
            final String modifiedErrorMessage =
                originalErrorMessage.replaceFirst('Error:', '').trim();
            final String cleanedErrorMessage = modifiedErrorMessage.replaceAll(
                RegExp(r'^DioError\[unknown\]: null\n'), '');
            errorMessage = cleanedErrorMessage;
          }
        } catch (e) {
          throw err; // Rethrow the original exception
        }
      } else if (err.response?.statusCode == HttpStatus.unauthorized ||
          (err.error.toString()).contains("Unauthorized")) {
        errorMessage = "Unauthorized. Invalid credential";
      } else if (err.response?.statusCode == HttpStatus.forbidden ||
          (err.error.toString()).contains(
              "Forbidden. You do not have permission to access this resource.")) {
        errorMessage =
            "Forbidden. You do not have permission to access this resource.";
      } else if (err.response?.statusCode == HttpStatus.notFound ||
          (err.error.toString()).contains(
              "Not found. The resource you requested could not be found.")) {
        errorMessage =
            "Not found. The resource you requested could not be found.";
      } else if (err.response?.statusCode == HttpStatus.methodNotAllowed ||
          (err.error.toString()).contains(
              "Method not allowed. Please check your request method.")) {
        errorMessage = "Method not allowed. Please check your request method.";
      } else if (err.response?.statusCode == HttpStatus.conflict ||
          (err.error.toString()).contains(
              "Conflict. Please resolve the conflict and try again.")) {
        errorMessage = "Conflict. Please resolve the conflict and try again.";
      } else if (err.response?.statusCode == 500 ||
          err.response?.statusCode == HttpStatus.internalServerError ||
          (err.error.toString())
              .contains("Internal Server error. Please try again later.")) {
        errorMessage = "Internal Server error. Please try again later.";
      } else {
        errorMessage =
            "An error occurred while processing your request. Please try again later.";
      }
    } else if (err.type == DioExceptionType.cancel ||
        (err.error.toString())
            .contains("Connection timeout. Please try again later.")) {
      errorMessage = "The request was cancelled.";
    } else if (err.type == DioExceptionType.unknown) {
      if ((err.error is SocketException) ||
          (err.error.toString())
              .contains("Check your internet connection and try again.")) {
        errorMessage = "Check your internet connection and try again.";
      } else if (err.error is HttpException ||
          (err.error.toString()).contains(
              "An HTTP exception occurred. Please try again later.")) {
        errorMessage = "An HTTP exception occurred. Please try again later.";
      } else if (err.error is FormatException ||
          (err.error.toString()).contains(
              "A format exception occurred. Please try again later.")) {
        errorMessage = "A format exception occurred. Please try again later.";
      } else if (err.response != null) {
        errorMessage = err.response!.data.toString();
      } else {
        errorMessage = "An error occurred. Please try again later.";
      }
    }

    throw errorMessage;
  }
}
