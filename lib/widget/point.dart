import 'package:flutter/material.dart';

import '../app/constant.dart';
class Point extends StatelessWidget {
  Point({required this.fillColor, super.key,this.isSelect=false});

  final Color fillColor;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 20,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color:isSelect? kTextLightColor:Colors.transparent),
      ),
      child: Container(decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
      ),),
    );
  }
}