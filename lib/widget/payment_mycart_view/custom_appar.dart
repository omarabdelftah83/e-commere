
import 'package:flutter/material.dart';

import '../../pressention/core/utils.dart';

AppBar BuildAppar(String title,BuildContext context){
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title:  Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );

}
