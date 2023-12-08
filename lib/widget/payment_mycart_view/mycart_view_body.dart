import 'package:chats/widget/payment_mycart_view/item_total_price.dart';
import 'package:chats/widget/payment_mycart_view/item_view_body.dart';
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
            const SizedBox(height: 20,),
            ////item...///
            const OrderInfoItem(title: 'Order Subtotal', value: '42.97'),
            const OrderInfoItem(title: 'Discount', value: '42'),
            const OrderInfoItem(title: 'Shipping', value: '5'),
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
            ////total price...///
            const TotalPrice(title: 'Total Price', value: '49'),
            const SizedBox(height: 15,),
            ////elevated button...///
            CustomButton(backgroundColor1: const Color(0xFF34A853),
                backgroundColor2: Colors.black,
                textColor: Colors.grey,
                title: 'Complete Payment',
                onPressed: (){
                  Navigator.pushNamed(context, Routes.PaymentDetails);
                 //  showModalBottomSheet(
                 //      context: context,
                 //      shape: RoundedRectangleBorder(
                 //          borderRadius: BorderRadius.circular(16)),
                 //      builder: (context) {
                 //        return const PaymentMethodsBottomSheet();
                 //      });



                }),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}



















class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() => _PaymentMethodsBottomSheetState();
}
class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                isActive: activeIndex == 0,
                onTap: () {
                  setState(() {
                    activeIndex = 0;
                  });
                },
              ),
              PaymentMethodItem(
                image: 'assets/images/Group.png',
                isActive: activeIndex == 1,
                onTap: () {
                  setState(() {
                    activeIndex = 1;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(backgroundColor1: const Color(0xFF34A853),
              backgroundColor2: Colors.black,
              textColor: Colors.grey,
              title: 'Complete Payment',
              onPressed: (){
                Navigator.pushNamed(context, Routes.PaymentDetails);

              }),
        ],
      ),
    );
  }
}