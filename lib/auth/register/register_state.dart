
abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}
class LoadingState extends RegisterState {}
class FieldChangedState extends RegisterState {}
class LoadedState extends RegisterState {}
class EmailAlreadyRegisteredState extends RegisterState {}

class ErrorState extends RegisterState {
  final String message;

  ErrorState(this.message);
}

class ValidationErrorState extends RegisterState {
  final String emailError;
  final String passError;
  final String firstNameError;
  final String secondNameError;
  final String confirmPasswordError;
  final String phoneNumberError;

  ValidationErrorState(this.emailError, this.passError, this.firstNameError, this.secondNameError, this.confirmPasswordError, this.phoneNumberError);
}