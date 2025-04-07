library;

import 'package:datastore/provider/session/session_provider_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.dart';
import 'package:login/domain/usecase/login_usecase.dart';

import 'data/request/login_request.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Dio dio = Dio();
}

void doLogin() async {
  final loginUseCase = getIt<LoginUseCase>();
  final loginRequest = LoginRequest("mina@gmail.com", "123456");

  final result = await loginUseCase.execute(loginRequest);
  result.fold((failure) {
    print("Login Failed: ${failure.message}");
  }, (loginModel) {
    print("Login Success: ${loginModel.name}");
  });
}
