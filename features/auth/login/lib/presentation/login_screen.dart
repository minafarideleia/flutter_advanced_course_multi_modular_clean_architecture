import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_state.dart';

class LoginScreen extends StatelessWidget {
  final loginUseCase = getIt<LoginUseCase>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(loginUseCase),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return Padding(padding: EdgeInsets.all(16.0));
        }),
      ),
    );
  }
}
