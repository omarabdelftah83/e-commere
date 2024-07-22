import 'package:flutter/material.dart';

import '../../app/constant.dart';
import '../../model/entity.dart';
import '../../widget/dateils_body.dart';


class DatilesScreen extends StatelessWidget {
  const DatilesScreen({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: detailsAppBar(context),
      body: DetailsBody(product: product, reviews: [],),

    );
  }
}

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(right: kDefaultPadding),
      icon: const Icon(
        Icons.arrow_back,
        color: kPrimaryColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    title: Text(
      'رجوع',
    ),
  );
}