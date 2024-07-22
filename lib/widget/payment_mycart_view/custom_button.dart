import 'package:chats/pressention/core/utils.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.backgroundColor1,
        required this.backgroundColor2,
        required this.textColor,
        required this.title,
        required this.onPressed});

  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 55,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: backgroundColor2, backgroundColor: backgroundColor1, disabledForegroundColor: textColor.withOpacity(0.38), disabledBackgroundColor: textColor.withOpacity(0.12),
            // لون النص عند تمرير الماوس أو اللمس بالزر
            padding: const EdgeInsets.all(16),
            // هوامش داخلية للزر
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // شكل الزر
            ),
          ),
          child: Text(title,style: Styles.style22,)),
    );
  }
}
