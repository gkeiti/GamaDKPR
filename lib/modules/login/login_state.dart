abstract class LoginState {}

class LoginStateSucess extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateError extends LoginState {
  final String errorMessage;

  LoginStateError({required this.errorMessage});
}
