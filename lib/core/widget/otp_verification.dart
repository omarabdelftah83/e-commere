import 'package:chats/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpTextFieldVerification extends StatelessWidget {
  final Function(String) onCodeEntered; // ممرر للاستدعاء عندما يتم إدخال الكود

  const OtpTextFieldVerification({
    Key? key,
    required this.onCodeEntered, // تأكد من أن الدالة المطلوبة تم تمريرها
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      cursorColor: Colors.orange,
      numberOfFields: 6,
      borderColor: AppColors.lightBrown,
      showFieldAsBox: true,
      fieldWidth: 50,
      fieldHeight: 70,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightBrown,
        fontFamily: 'Poppins',
      ),
      focusedBorderColor: Colors.lightBlue,
      enabledBorderColor: Color(0xFFD9D9D9),
      onSubmit: (String verificationCode) {
        onCodeEntered(verificationCode); // استدعاء الدالة عند إدخال الكود
      },
    );
  }
}
