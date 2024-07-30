import 'package:bloc/bloc.dart';
import 'package:chats/app/routes.dart';
import 'package:chats/auth/firestore/fire_Store.dart';
import 'package:chats/auth/register/register_event.dart';
import 'package:chats/auth/register/register_state.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  String email = '';
  String emailError = '';
  String password = '';
  String passError = '';

  String firstName = '';
  String firstNameError = '';

  String secondName = '';
  String secondNameError = '';

  String confirmPassword = '';
  String confirmPasswordError = '';

  String phoneNumber = '';
  String phoneNumberError = '';
  final _auth = FirebaseAuth.instance;

  RegisterBloc() : super(RegisterInitial()) {
    on<ButtonEvent>(_onRegister);
  }

  Future<void> _onRegister(ButtonEvent event, Emitter<RegisterState> emit) async {
    emit(LoadingState());

    if (!validateInput()) {
      emit(ValidationErrorState(emailError, passError, firstNameError,
          secondNameError, confirmPasswordError, phoneNumberError));
      return;
    }

    if (password != confirmPassword) {
      emit(ValidationErrorState(emailError, passError, firstNameError,
          secondNameError, AppStrings.passwordsDoNotMatchError, phoneNumberError));
      return;
    }

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        userId: newUser.user?.uid,
        firstName: firstName,
        secondName: secondName,
        email: newUser.user?.email,
        phone: phoneNumber,
      );
      await FireStoreUser().addUserToFireStore(userModel);
      Navigator.pushNamed(event.context, Routes.homePage);
      emit(LoadedState());
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        emit(EmailAlreadyRegisteredState());
        _showEmailAlreadyRegisteredError(event.context);
      } else {
        emit(ErrorState(AppStrings.registrationFailedError));
      }
    }
  }

  bool validateInput() {
    bool isValid = true;

    if (firstName.isEmpty) {
      firstNameError = AppStrings.firstNameEmptyError;
      isValid = false;
    } else {
      firstNameError = '';
    }

    if (secondName.isEmpty) {
      secondNameError = AppStrings.secondNameEmptyError;
      isValid = false;
    } else {
      secondNameError = '';
    }

    if (email.isEmpty) {
      emailError = AppStrings.emailEmptyError;
      isValid = false;
    } else {
      emailError = '';
    }

    if (password.isEmpty) {
      passError = AppStrings.passwordEmptyError;
      isValid = false;
    } else {
      passError = '';
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError = AppStrings.confirmPasswordEmptyError;
      isValid = false;
    } else if (confirmPassword != password) {
      confirmPasswordError = AppStrings.passwordsDoNotMatchError;
      isValid = false;
    } else {
      confirmPasswordError = '';
    }

    if (phoneNumber.isEmpty) {
      phoneNumberError = AppStrings.phoneNumberEmptyError;
      isValid = false;
    } else {
      phoneNumberError = '';
    }

    return isValid;
  }

  void onChangeEmail(String value) {
    email = value;
    emailError = '';
    emit(FieldChangedState());
  }

  void onChangePass(String value) {
    password = value;
    passError = '';
    emit(FieldChangedState());
  }

  void onChangeFirstName(String value) {
    firstName = value;
    firstNameError = '';
    emit(FieldChangedState());
  }

  void onChangeSecondName(String value) {
    secondName = value;
    secondNameError = '';
    emit(FieldChangedState());
  }

  void onChangeConfirmPassword(String value) {
    confirmPassword = value;
    confirmPasswordError = '';
    emit(FieldChangedState());
  }

  void onChangePhoneNumber(String value) {
    phoneNumber = value;
    phoneNumberError = '';
    emit(FieldChangedState());
  }

  void _showEmailAlreadyRegisteredError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(AppStrings.emailAlreadyRegisteredError),  actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
