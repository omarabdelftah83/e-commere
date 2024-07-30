import 'package:chats/core/catch/prefrence.dart';
import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final double? textSizeFactor;
  final double? textSizePercentage;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
    this.fontFamily,
    this.textOverflow,
    this.textSizeFactor,
    this.textSizePercentage,
  });

  @override
  Widget build(BuildContext context) {
    String? _fontFamily = fontFamily;

    if (_fontFamily == null) {
      if (detectLanguageWithRegExp(text) == 'Arabic' ||
          PreferenceManager().currentLang() == 'ar') {
        _fontFamily = 'GE';
      } else if (detectLanguageWithRegExp(text) == 'English' ||
          PreferenceManager().currentLang() == 'en') {
        _fontFamily = 'Montserrat';
      }
    }

    final mediaQuery = MediaQuery.of(context);
    double finalTextSize =
        fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize!;

    if (textSizeFactor != null) {
      finalTextSize *= textSizeFactor!;
    } else if (textSizePercentage != null) {
      finalTextSize = mediaQuery.size.width * (textSizePercentage! / 100);
    }

    return Text(
      text,

      style: TextStyle(

          fontSize: fontSize,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w700,
          height: height ?? 1.8,
          fontFamily: _fontFamily ??
              (PreferenceManager().currentLang() == 'ar' ? 'GE' : 'Montserrat'),
          decoration: textDecoration),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,

    );
  }

  String detectLanguageWithRegExp(String text) {
    RegExp arabicRegExp = RegExp(
        r'[\u0600-\u06FF]+'); // Matches Arabic characters
    RegExp englishRegExp = RegExp(r'[A-Za-z]+'); // Matches English letters

    if (arabicRegExp.hasMatch(text)) {
      return 'Arabic';
    } else if (englishRegExp.hasMatch(text)) {
      return 'English';
    }

    return 'Unknown';
  }
}
