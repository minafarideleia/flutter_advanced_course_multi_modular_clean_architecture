import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/login_event.dart';
import 'package:login/presentation/login_state.dart';

import '../domain/usecase/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    // handle UsernameChanged event
    on<UsernameChanged>((event, emit) {
      // do the logic here
    });

    // handle PasswordChanged event
    on<PasswordChanged>((event, emit) {
      // do the logic here
    });

    // handle PasswordChanged event
    on<LoginButtonPressed>((event, emit) {
      // do the logic here
    });
  }
}
