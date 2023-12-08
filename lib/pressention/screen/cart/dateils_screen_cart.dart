import 'package:chats/pressention/screen/cart/dateils_body_cart.dart';
import 'package:flutter/material.dart';

import '../../../app/constant.dart';
import '../../../model/entity.dart';


class DatilesScreenCart extends StatelessWidget {
  const DatilesScreenCart({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: detailsAppBar(context),
      body: DetailsBodyCart(product: product,),

    );
  }
}

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(right: kDefaultPadding),
      icon: Icon(
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
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}