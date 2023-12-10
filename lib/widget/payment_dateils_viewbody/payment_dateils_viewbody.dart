import 'package:chats/widget/payment_dateils_viewbody/custom_credit_cart.dart';
import 'package:chats/widget/payment_dateils_viewbody/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/routes.dart';
import '../../controller/provider.dart';
import '../payment_mycart_view/custom_button.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentDetailsProvider = Provider.of<PaymentDetailsProvider>(context);
    return CustomScrollView(
      slivers: [
        // photo Row ...////
        SliverToBoxAdapter(
          child: Row(
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
        ),
        //CustomCreditCard...////
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: paymentDetailsProvider.formKey,
            autovalidateMode: paymentDetailsProvider.autovalidateMode,
          ),
        ),
        //...CustomButton...///
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CustomButton(
                  backgroundColor1: const Color(0xFF34A853),
                  backgroundColor2: Colors.black,
                  textColor: Colors.grey,
                  title: 'Pay',
                  onPressed: () {
                    if (paymentDetailsProvider.formKey.currentState!.validate()) {
                    paymentDetailsProvider.  formKey.currentState!.save();
                    } else {
                    paymentDetailsProvider.updateAutovalidateMode(AutovalidateMode.always);
                      Navigator.pushNamed(context, Routes.ThankYou);
                    }
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

