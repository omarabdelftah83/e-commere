import 'package:chats/widget/payment_dateils_viewbody/custom_credit_cart.dart';
import 'package:chats/widget/payment_dateils_viewbody/payment_method_item.dart';
import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../payment_mycart_view/custom_button.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  _PaymentDetailsViewBodyState createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  int activeIndex = -1;
  final GlobalKey<FormState> formKey=GlobalKey();
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // photo Row ...////
        SliverToBoxAdapter(
          child: Row(
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
        ),
        //CustomCreditCard...////
         SliverToBoxAdapter(
          child: CustomCreditCard(formKey: formKey, autovalidateMode: autovalidateMode,),
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
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                    }else{
                      autovalidateMode=AutovalidateMode.always;
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





















// return SingleChildScrollView(
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8),
//     child: Column(
//       children: [
//         const SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PaymentMethodItem(
//               image: 'assets/images/SVGRepo_iconCarrier.png',
//               isActive: activeIndex == 0,
//               onTap: () {
//                 setState(() {
//                   activeIndex = 0;
//                 });
//               },
//             ),
//             PaymentMethodItem(
//               image: 'assets/images/Group.png',
//               isActive: activeIndex == 1,
//               onTap: () {
//                 setState(() {
//                   activeIndex = 1;
//                 });
//               },
//             ),
//           ],
//         ),
//         const CustomCreditCard(),
//         const SizedBox(height: 10,),
//         CustomButton(backgroundColor1: const Color(0xFF34A853),
//             backgroundColor2: Colors.black,
//             textColor: Colors.grey,
//             title: 'Pay',
//             onPressed: (){
//              // Navigator.pushNamed(context, Routes.PaymentDetails);
//
//             }),
//         const SizedBox(height: 10,)
//
//       ],
//     ),
//   ),
// );