import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chats/app/routes.dart';
import 'package:chats/core/apptext/app_text.dart';
import 'package:chats/core/resources/app_colors.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:chats/core/textfailed/custom_text_failed.dart';
import 'package:chats/widget/button.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, vertical: screenHeight * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            const AppText(
              text: 'Forget Password',
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
            SizedBox(height: screenHeight * 0.01),
            const AppText(
              text: 'Enter your Phone number to recover\nyour password',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomTextField(
              prefixIcon: const Icon(Icons.phone_android),
              hintText: AppStrings.phoneNumber,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            SizedBox(height: screenHeight * 0.07),
            AppButton(
              height: screenHeight * 0.06,
              color: Colors.blue,
              title: AppStrings.continues,
              borderRadius: 10,
              onTap: () async {
                await phoneAuth(phoneNumber);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> phoneAuth(String phoneNumber) async {
    String formattedPhoneNumber = formatPhoneNumber(phoneNumber);
    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {

      },
      verificationFailed: (FirebaseAuthException e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed: ${e.message}')),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(context, Routes.otpPage, arguments: {
            'verificationId': verificationId
          });

      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

  String formatPhoneNumber(String phoneNumber) {
    if (!phoneNumber.startsWith('+')) {
      // Add country code if not present
      return '+2$phoneNumber'; // Corrected country code for Egypt
    }
    return phoneNumber;
  }
}
