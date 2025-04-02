import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
