import 'package:chats/app/routes.dart';
import 'package:chats/auth/sing_in/sing_in_bloc.dart';
import 'package:chats/core/apptext/app_text.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:chats/core/textfailed/custom_text_failed.dart';
import 'package:chats/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chats/core/resources/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SingInBloc(),
      child: BlocBuilder<SingInBloc, SingInState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<SingInBloc>(context);
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06,
                    vertical: screenHeight * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: screenHeight * 0.06),
                    const AppText(
                      text: AppStrings.signIn,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    CustomTextField(
                      errorText: bloc.emailError,
                      prefixIcon: const Icon(Icons.email),
                      hintText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: bloc.onChangeEmail,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      errorText: bloc.passError,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: AppStrings.password,
                      isPassword: true,
                      obscureText: true,
                      onChanged: bloc.onChangePass,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.forGetPassword);

                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: AppText(
                          text: AppStrings.forgetPass,
                          fontWeight: FontWeight.w400,
                          color:Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    AppButton(
                      height: screenHeight * 0.06,
                      loading: state is LoadingState,
                      color: Colors.blue,
                      title: AppStrings.signUp,
                      borderRadius: 10,
                      onTap: () async {
                        bloc.add(ButtonEventEmailAndPassword(context));
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Center(child: AppText(text: AppStrings.or)),
                    SizedBox(height: screenHeight * 0.03),
                    AppButton(
                      loading: state is LoadinggState,
                      height: screenHeight * 0.06,
                      color: Colors.grey[300],
                      textColor: AppColors.buttonTextColor,
                      title: AppStrings.singInWithGoogle,
                      borderRadius: 10,
                      onTap: () async {
                        bloc.add(ButtonEventWithGoogle(context));
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    AppButton(
                      height: screenHeight * 0.06,
                      color: Colors.grey[300],
                      textColor: AppColors.buttonTextColor,
                      title: AppStrings.singInWithFaceBook,
                      borderRadius: 10,
                      onTap: () async {},
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    InkWell(

                      onTap: (){
                        Navigator.pushNamed(context, Routes.registrationScreen);

                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text:  const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Don,t have an account ? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                )),
                            TextSpan(
                              text: 'Sing up here',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
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
