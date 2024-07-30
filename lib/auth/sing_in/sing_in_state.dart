part of 'sing_in_bloc.dart';

@immutable
sealed class SingInState {}

final class SingInInitial extends SingInState {}
class FieldChangedState extends SingInState {}
class LoadingState extends SingInState {}
class LoadinggState extends SingInState {}

class LoadedState extends SingInState {}
class LoadeddState extends SingInState {}

class EmailAlreadyRegisteredState extends SingInState {}
class ErrorState extends SingInState {
  final String message;

  ErrorState(this.message);
}
class ValidationErrorState extends SingInState {
  final String emailError;
  final String passError;

  ValidationErrorState(this.emailError, this.passError,);
}