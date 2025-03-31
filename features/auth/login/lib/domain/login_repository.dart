import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
}
