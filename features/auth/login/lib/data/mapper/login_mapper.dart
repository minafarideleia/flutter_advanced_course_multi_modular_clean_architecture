import 'package:login/data/response/login_response.dart';
import 'package:login/domain/model/login_model.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(name: this?.name, phone: this?.phone, age: this?.age);
  }
}
