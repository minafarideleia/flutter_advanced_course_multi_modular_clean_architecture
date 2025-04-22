import 'package:equatable/equatable.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginState extends Equatable {
  final String? usernameError;
  final String? passwordError;
  final String? errorMessage;
  final StateRendererType stateRendererType;

  const LoginState(
      {this.usernameError,
      this.passwordError,
      this.errorMessage,
      this.stateRendererType = StateRendererType.contentState});

  LoginState copyWith(
      {String? usernameError,
      String? passwordError,
      String? errorMessage,
      StateRendererType? stateRenderType}) {
    return LoginState(
        usernameError: usernameError,
        passwordError: passwordError,
        errorMessage: errorMessage,
        stateRendererType: stateRendererType);
  }

  @override
  List<Object?> get props =>
      [usernameError, passwordError, errorMessage, stateRendererType];
}

// initial state
class LoginInitial extends LoginState {
  const LoginInitial()
      : super(stateRendererType: StateRendererType.contentState);
}

// loading state
class LoginLoading extends LoginState {
  const LoginLoading()
      : super(stateRendererType: StateRendererType.fullScreenLoadingState);
}

// invalid inputs state
class LoginInvalid extends LoginState {
  final String? usernameError;
  final String? passwordError;

  const LoginInvalid({this.usernameError, this.passwordError})
      : super(
            usernameError: usernameError,
            passwordError: passwordError,
            stateRendererType: StateRendererType.contentState);
}

// success state
class LoginSuccess extends LoginState {
  const LoginSuccess()
      : super(stateRendererType: StateRendererType.contentState);
}

// error state
class LoginError extends LoginState {
  final String? errorMessage;

  const LoginError({this.errorMessage})
      : super(
            errorMessage: errorMessage,
            stateRendererType: StateRendererType.fullScreenErrorState);
}
