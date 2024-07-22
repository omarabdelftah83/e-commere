import 'package:flutter/material.dart';

import '../app/routes.dart';

class ElevaatedButton extends StatelessWidget {
  const ElevaatedButton(
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
      width: 300,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: backgroundColor2,
            backgroundColor: backgroundColor1,
            disabledForegroundColor: textColor.withOpacity(0.38),
            disabledBackgroundColor: textColor.withOpacity(0.12),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // شكل الزر
            ),
          ),
          child: Text(title)),
    );
  }
}
