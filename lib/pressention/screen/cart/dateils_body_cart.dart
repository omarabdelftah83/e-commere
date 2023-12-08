import 'package:chats/widget/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/constant.dart';
import '../../../model/entity.dart';
import '../../../widget/point.dart';
import '../../../app/control.dart';


class DetailsBodyCart extends StatelessWidget {
  DetailsBodyCart({required this.product, super.key});

  final Product product;
  final cartController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: size.width * 1.09,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: ProductImage(
                      size: size,
                      image: product.image,
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Point(
                        fillColor: kTextLightColor,
                        isSelect: true,
                      ),
                      Point(
                        fillColor: Colors.blueAccent,
                      ),
                      Point(
                        fillColor: Colors.red,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5, // 30 px padding
                            vertical: kDefaultPadding / 5, // 5 px padding
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'السعر: \$${product.price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      MaterialButton(
                        height: kDefaultPadding * 1.5,
                        color: Colors.redAccent,
                        onPressed: (){
                          cartController.removeToCart(product);

                        },child: const Row(
                        children: [
                          Text('delate'),
                          SizedBox(width: 10,),
                          Icon(Icons.delete),
                        ],),),



                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
        ],
      ),
    );
  }
}