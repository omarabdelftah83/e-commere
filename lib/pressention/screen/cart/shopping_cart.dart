import 'package:chats/app/control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../model/entity.dart';
import '../../../widget/product_cart.dart';
import '../dateils_screen.dart';
import 'dateils_screen_cart.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({super.key});

  HomeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(),
        body: controller.cartProduct.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : ListView.builder(
                itemCount: controller.cartProduct.length,
                itemBuilder: (context, index) =>
                    //index =>connect itemCount and list
                    ProductCart(
                      product: products[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DatilesScreenCart(
                                      product: products[index],
                                    )));
                      },
                    )),
      );
    });
  }
}
