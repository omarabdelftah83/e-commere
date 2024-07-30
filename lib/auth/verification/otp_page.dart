import 'package:chats/app/routes.dart';
import 'package:chats/core/resources/app_strings.dart';
import 'package:chats/core/widget/otp_verification.dart';
import 'package:chats/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPage extends StatefulWidget {
  final String verificationId;

  const VerifyPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'OTP Authentication',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              'An authentication code has been sent to your phone number',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            OtpTextFieldVerification(
              onCodeEntered: (value) {
                otpController.text = value;
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              height: screenHeight * 0.06,
              color: Colors.blue,
              title: AppStrings.continues,
              borderRadius: 10,
              onTap: () async {
                await _verifyOTP(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _verifyOTP(BuildContext context) async {
    final String smsCode = otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushNamed(context, Routes.homePage);

    } catch (e) {
      if (e is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP: ${e.message}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    }
  }
}
