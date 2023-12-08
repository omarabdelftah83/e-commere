import 'package:flutter/material.dart';

import '../../../widget/payment_mycart_view/custom_appar.dart';
import '../../../widget/thankyou/thank_you._viewbody.dart';
class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BuildAppar('', context),
      body: const ThankYouViewBody(),
    );
  }
}
