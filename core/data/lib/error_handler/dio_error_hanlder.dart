import 'package:data/error_handler/data_source.dart';
import 'package:data/error_handler/data_source_extension.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/failure.dart';

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
    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();
  }
}
