import 'package:chats/widget/product_cart.dart';
import 'package:flutter/material.dart';
import '../app/constant.dart';
import '../model/entity.dart';
import '../screen/dateils_screen.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Stack(
            children: [
              //container 1//
              Container(
                margin: EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
              ),
              //container 2//
              ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                  //index =>connect itemCount and list
                  ProductCart(
                    product: products[index],
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DatilesScreen(product: products[index],)));
                    },
                  )),
            ],
          ),
        )
      ],
    ) ,

    );
  }
}