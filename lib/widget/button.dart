import 'package:chats/core/apptext/app_text.dart';
import 'package:chats/core/dialog/confirm_dialog.dart';
import 'package:chats/core/resources/app_colors.dart';
import 'package:chats/core/resources/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final dynamic title;
  final VoidCallback? onTap;
  final bool? loading;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? heightText;
  final Color? textColor;
  final bool? enableBorder;
  final double? horizontalPadding;
  final Widget? leading;
  final FontWeight fontWeight;
  final bool? hasConfirm;
  final bool? isDisable;
  final VoidCallback? onConfirm;

  final double? borderRadius;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.loading = false,
    this.color,
    this.textColor,
    this.enableBorder = false,
    this.width,
    this.height,
    this.horizontalPadding,
    this.heightText,
    this.fontSize,
    this.leading,
    this.fontWeight = FontWeight.bold,
    this.borderColor = Colors.black,
    this.hasConfirm,
    this.onConfirm,
    this.isDisable,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return loading == true ? _loading() : _button(context);
  }
  final double _margeHorizontal = 10.0;

  BoxDecoration _decoration() {
    if (color != null) {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: color,
          border: Border.all(
              color: enableBorder == true ? borderColor! : color!,
              width: enableBorder == true ? 1.5 : 0));
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.primaryColor));
    }
  }

  Widget _loading() {
    return Container(
      alignment: Alignment.center,
      width: width ?? double.maxFinite,
      height: height ?? 55,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? _margeHorizontal),
      decoration: _decoration(),
      child: const LoadingView(
        isButton: true,
        color: Colors.white,
      ),
    );
  }

  Widget _button(context) {
    return isDisable == true
        ? Container(
      alignment: Alignment.center,
      height: height ?? 55,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? _margeHorizontal),
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            leading ?? const SizedBox(),
            if (title is String) ...[
              AppText(
                text: title,
                fontSize: fontSize ?? 15,
                color: AppColors.primaryColor,
                fontWeight: fontWeight,
                height: heightText ?? 1,
              )
            ] else ...[
              title
            ]
          ],
        ),
      ),
    )
        : GestureDetector(
      onTap: onTap ??
          (hasConfirm == true
              ? () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return ConfirmDialog(
                  onConfirm: onConfirm ?? () {},
                );
              },
            );
          }
              : () {}),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 55,
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? _margeHorizontal),
        width: width ?? double.maxFinite,
        decoration: _decoration(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              leading ?? const SizedBox(),
              if (title is String) ...[
                AppText(
                  text: title,
                  fontSize: fontSize ?? 15,
                  color: textColor == AppColors.primaryColor
                      ? Colors.black
                      : textColor ?? Colors.white,
                  fontWeight: fontWeight,
                  height: heightText ?? 1,
                )
              ] else ...[
                title
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: double.infinity,
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(30),
          child: MaterialButton(
            onPressed: onPressed,
            height: 42,
            minWidth: 300,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
