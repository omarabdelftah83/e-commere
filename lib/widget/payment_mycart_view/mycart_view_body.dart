import 'package:chats/widget/payment_mycart_view/item_total_price.dart';
import 'package:chats/widget/payment_mycart_view/item_view_body.dart';
import 'package:chats/widget/payment_mycart_view/payment_method_bottom_sheet.dart';
import 'package:chats/widget/payment_mycart_view/stack.dart';
import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../payment_dateils_viewbody/payment_method_item.dart';
import 'custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ////stack...///
            const StackImage(),
            const SizedBox(
              height: 20,
            ),
            ////item...///
            const OrderInfoItem(title: 'Order Subtotal', value: '42.97'),
            const OrderInfoItem(title: 'Discount', value: '42'),
            const OrderInfoItem(title: 'Shipping', value: '5'),
            const SizedBox(
              height: 15,
            ),
            ////line...////
            Container(
              width: 320,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFC6C6C6),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ////total price...///
            const TotalPrice(title: 'Total Price', value: '49'),
            const SizedBox(
              height: 15,
            ),
            ////elevated button...showModalBottomSheet///
            CustomButton(
                backgroundColor1: const Color(0xFF34A853),
                backgroundColor2: Colors.black,
                textColor: Colors.grey,
                title: 'Complete Payment',
                onPressed: () {
                  //  Navigator.pushNamed(context, Routes.PaymentDetails);
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      builder: (context) {
                        return const PaymentMethodsBottomSheet();
                      });
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
