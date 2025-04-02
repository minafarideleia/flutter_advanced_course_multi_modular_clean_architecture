import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/model/localised_message.dart';

Future<Either<Failure, T>> safeAPiCall<T>(Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    return Right(response);
  } catch (error) {
    return Left(
        Failure(0, LocalisedMessage("", ""))); // todo add error handler here
  }
}
