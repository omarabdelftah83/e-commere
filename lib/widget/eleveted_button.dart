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
            primary: backgroundColor1,
            // لون الخلفية للزر
            onPrimary: backgroundColor2,
            // لون النص على الزر
            onSurface: textColor,
            // لون النص عند تمرير الماوس أو اللمس بالزر
            padding: const EdgeInsets.all(16),
            // هوامش داخلية للزر
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // شكل الزر
            ),
          ),
          child: Text(title)),
    );
  }
}
