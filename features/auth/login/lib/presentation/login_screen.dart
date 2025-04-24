import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase.dart';
import 'package:login/presentation/login_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';
import 'package:navigator/navigation_bloc.dart';
import 'package:navigator/navigation_event.dart';
import 'package:presentation/state_renderer/state_renderer.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginScreen extends StatelessWidget {
  final loginUseCase = getIt<LoginUseCase>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          if (state is LoginSuccess) {
            // call the navigation on successful login to navigate to main screen
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _navigateToHome(context);
            });
          }

          return Stack(
            children: [
              _buildMainScreenContent(context, state),
              _buildStateRenderer(context, state)
            ],
          );
        }),
      ),
    );
  }

  void _navigateToHome(BuildContext context){
    context.read<NavigationBloc>().add(NavigateToHome());
  }

  Widget _buildMainScreenContent(BuildContext context, LoginState state) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          controller: usernameController,
          onChanged: (value) {
            context.read<LoginBloc>().add(UsernameChanged(value));
          },
          decoration: InputDecoration(
              labelText: "Username",
              errorText: state is LoginInvalid ? state.usernameError : null),
        ),
        TextField(
          controller: passwordController,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(value));
          },
          decoration: InputDecoration(
              labelText: "Password",
              errorText: state is LoginInvalid ? state.passwordError : null),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              final username = usernameController.text;
              final password = passwordController.text;
              context
                  .read<LoginBloc>()
                  .add(LoginButtonPressed(username, password));
            },
            child: Text("Login"))
      ]),
    );
  }

  Widget _buildStateRenderer(BuildContext context, LoginState state) {
    if (state.stateRendererType == StateRendererType.contentState) {
      // we don't want to display any overlay when the content of the screen is displayed
      return SizedBox.shrink();
    }

    return StateRenderer(
      stateRendererType: state.stateRendererType,
      message: (state is LoginError) ? state.errorMessage ?? "" : "",
      retryActionFunction: () {
        final username = usernameController.text;
        final password = passwordController.text;
        context.read<LoginBloc>().add(LoginButtonPressed(username, password));
      },
    );
  }
}
