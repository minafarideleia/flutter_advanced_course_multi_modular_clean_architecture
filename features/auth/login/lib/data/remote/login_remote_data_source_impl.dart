import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/service/login_service.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginService loginService;

  LoginRemoteDataSourceImpl(this.loginService);

  @override
  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    return safeAPiCall(() async {
      final response =
          await loginService.login(loginRequest.email, loginRequest.password);

      return response.data;
    });
  }
}
