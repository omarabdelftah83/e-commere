
import 'package:bloc/bloc.dart';
import 'package:chats/app/routes.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'sing_in_event.dart';
part 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  String email = '';
  String emailError = '';
  String password = '';
  String passError = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  SingInBloc() : super(SingInInitial()) {
    on<ButtonEventEmailAndPassword>(_singInEmailAndPassword);
    on<ButtonEventWithGoogle>(_singInWithGoogle);
  }

  Future<void> _singInEmailAndPassword(ButtonEventEmailAndPassword event, Emitter<SingInState> emit) async {
    emit(LoadingState());

    if (!validateInput()) {
      emit(ValidationErrorState(emailError, passError));
      return;
    }

    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        Navigator.pushNamed(event.context, Routes.homePage);
        emit(LoadedState());
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          emit(ErrorState(AppStrings.userNotFoundError));
          _showUserNotFoundError(event.context);
        } else if (e.code == 'wrong-password') {
          emit(ErrorState(AppStrings.wrongPasswordError));
          _showWrongPasswordError(event.context);
        } else {
          emit(ErrorState(AppStrings.loginFailedError));
        }
      } else {
        emit(ErrorState(AppStrings.loginFailedError));
      }
    }
  }

  Future<void> _singInWithGoogle(ButtonEventWithGoogle event, Emitter<SingInState> emit) async {
   emit(LoadingState());
     try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        emit(ErrorState(AppStrings.loginFailedError)); // User canceled the login
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null)
      {

        Navigator.pushNamed(event.context, Routes.homePage);
        emit(LoadedState());
      }
    } catch (e) {
     emit(ErrorState(AppStrings.loginFailedError));
    }
  }

  bool validateInput() {
    bool isValid = true;
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

  void _showUserNotFoundError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(AppStrings.userNotFoundError),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showWrongPasswordError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(AppStrings.wrongPasswordError),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
