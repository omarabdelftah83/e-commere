import 'package:chats/widget/payment_mycart_view/custom_appar.dart';
import 'package:flutter/material.dart';

import '../../../widget/payment_dateils_viewbody/payment_dateils_viewbody.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppar('Payment Details', context),
      body:  const PaymentDetailsViewBody(),
    );
  }
}
