import 'package:chats/core/resources/app_colors.dart';
import 'package:chats/widget/button.dart';
import 'package:flutter/material.dart';




class ConfirmDialog  extends StatelessWidget {

  const ConfirmDialog ({super.key, required this.onConfirm});
  ///todo>>>>>>> design
  final VoidCallback onConfirm;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('confirmation dialog'),
      content: const Text(
          'are you sure! you want to do that !'
      ),
      actions:[
        /// Use AppButton ?? >>>> design will change but :
        AppButton(title: 'no',
          width: 150,
          height: 60,
          color: AppColors.primaryColor.withOpacity(.7),
          onTap: (){
            Navigator.of(context).pop();
          },),
        AppButton(
          width: 150,
          height: 60,title: 'yes',onTap:onConfirm,),

      ],
    );
  }
}
