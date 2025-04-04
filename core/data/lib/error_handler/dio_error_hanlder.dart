import 'package:data/error_handler/data_source.dart';
import 'package:data/error_handler/data_source_extension.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancelled.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.connectTimeOut.getFailure();
    default: // error has error body or error response and we have to send the status code and message we received.
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.defaultError.getFailure();
      }
  }
}
