import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

import '../domain/usecase/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    // handle UsernameChanged event
    on<UsernameChanged>((event, emit) {
      final usernameError = validateUsername(event.username);

      emit(LoginInvalid(
          usernameError: usernameError,
          passwordError: (state is LoginInvalid) ? state.passwordError : null));
    });

    // handle PasswordChanged event
    on<PasswordChanged>((event, emit) {
      final passwordError = validateUsername(event.password);

      emit(LoginInvalid(
          passwordError: passwordError,
          usernameError: (state is LoginInvalid) ? state.usernameError : null));
    });

    // handle PasswordChanged event
    on<LoginButtonPressed>((event, emit) {
      // do the logic here
    });
  }
}

String? validateUsername(String username) {
  if (username.isEmpty) {
    return "Username cannot be empty";
  } else if (username.length < 3) {
    return "Username must be at least 3 chars";
  }

  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return "password cannot be empty";
  } else if (password.length < 6) {
    return "password must be at least 6 chars";
  }

  return null;
}
