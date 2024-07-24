import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/routes.dart';
import '../../controller/provider.dart';
import '../payment_dateils_viewbody/payment_method_item.dart';
import 'custom_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentDetailsProvider = Provider.of<PaymentDetailsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaymentMethodItem(
                image: 'assets/images/SVGRepo_iconCarrier.png',
                isActive: paymentDetailsProvider.activeIndex == 0,
                onTap: () {
                  paymentDetailsProvider.updateActiveIndex(0);
                },
              ),
              PaymentMethodItem(
                image: 'assets/images/Group.png',
                isActive: paymentDetailsProvider.activeIndex == 1,
                onTap: () {
                  paymentDetailsProvider.updateActiveIndex(1);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
              backgroundColor1: const Color(0xFF34A853),
              backgroundColor2: Colors.black,
              textColor: Colors.grey,
              title: 'Complete Payment',
              onPressed: () {
                Navigator.pushNamed(context, Routes.paymentDetails);
              }),
        ],
      ),
    );
  }
}
