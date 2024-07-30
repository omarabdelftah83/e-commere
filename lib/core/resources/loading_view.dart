import 'package:chats/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoadingView extends StatelessWidget {
  final bool isButton;
  final Color? color;

  const LoadingView({super.key, this.isButton = false, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isButton ? Colors.transparent: null,
      child: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(color == null ? AppColors.primaryColor : color!, BlendMode.srcIn),
          child:const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
