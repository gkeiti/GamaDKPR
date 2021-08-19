abstract class RegisterState {}

class RegisterStateSucess extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateEmpty extends RegisterState {}

class RegisterStateError extends RegisterState {
  final String errorMessage;

  RegisterStateError({required this.errorMessage});
}
