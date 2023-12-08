import 'package:flutter/material.dart';
import '../../../widget/payment_mycart_view/custom_appar.dart';
import '../../../widget/payment_mycart_view/mycart_view_body.dart';


class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppar('My Cart',context),
      body: const MyCartViewBody(),
    );
  }
}
