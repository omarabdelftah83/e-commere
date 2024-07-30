import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chats/auth/register/register_bloc.dart';
import 'package:chats/auth/register/register_event.dart';
import 'package:chats/auth/register/register_state.dart';
import 'package:chats/core/apptext/app_text.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:chats/core/textfailed/custom_text_failed.dart';
import 'package:chats/widget/button.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<RegisterBloc>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    const AppText(
                      text: AppStrings.signUp,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            errorText: bloc.firstNameError,
                            prefixIcon: const Icon(Icons.person),
                            hintText: AppStrings.firstName,
                            keyboardType: TextInputType.name,
                            onChanged: bloc.onChangeFirstName,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: CustomTextField(
                            errorText: bloc.secondNameError,
                            prefixIcon: const Icon(Icons.person),
                            hintText: AppStrings.secondName,
                            keyboardType: TextInputType.name,
                            onChanged: bloc.onChangeSecondName,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextField(
                      errorText: bloc.emailError,
                      prefixIcon: const Icon(Icons.email),
                      hintText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: bloc.onChangeEmail,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextField(
                      errorText: bloc.passError,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: AppStrings.password,
                      isPassword: true,
                      obscureText: true,
                      onChanged: bloc.onChangePass,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextField(
                      errorText: bloc.confirmPasswordError,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: AppStrings.confirmPassword,
                      isPassword: true,
                      obscureText: true,
                      onChanged: bloc.onChangeConfirmPassword,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextField(
                      errorText: bloc.phoneNumberError,
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: AppStrings.phoneNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: bloc.onChangePhoneNumber,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        AppStrings.alreadyHaveAccount,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    AppButton(
                      height: screenHeight * 0.06,
                      loading: state is LoadingState,
                      color:Colors.blue,
                      title: AppStrings.signUp,
                      borderRadius: 10,
                      onTap: () async {
                        bloc.add(ButtonEvent(context));
                      },
                    ),
                    SizedBox(height: screenHeight * 0.04),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
