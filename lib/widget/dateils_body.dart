import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/constant.dart';
import '../model/entity.dart';
import '../app/control.dart';
import '../app/routes.dart';
import 'point.dart';
import 'product_image.dart';

class DetailsBody extends StatefulWidget {
  DetailsBody({required this.product, required this.reviews, Key? key})
      : super(key: key);

  final List<Review> reviews;
  final Product product;
  final cartController = Get.find<HomeScreenController>();

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  TextEditingController commentController = TextEditingController();
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: 1150,
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
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProductImage(
                      size: size,
                      image: widget.product.image,
                    ),
                  ),
                  const SizedBox(height: 27),
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
                      widget.product.title,
                   //   style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 5,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'السعر: \$${widget.product.price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      // cart button///
                      ElevatedButton.icon(
                        onPressed: () {
                          widget.cartController.addToCart(widget.product);
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text('add'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20),
                      //payment button..///
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.MyCartView);

                        },
                        icon: Icon(Icons.payment),

                        label: Text('pyment'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Text(
                widget.product.description,
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ),
            ),
            SizedBox(height: 20),

            ///////review....../////////
            Expanded(
              child: ListView.builder(
                itemCount: widget.reviews.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // تحديد نصف قطر الدائرة
                     // side: BorderSide(color: Colors.red), // اختيار لون الحدود
                    ),
                    child: ListTile(
                      title: Text(
                        'review: ${widget.reviews[index].rating}/5',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //    Text('user: ${widget.reviews[index].username}'),
                          Text(
                            'comment: ${widget.reviews[index].comment}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            widget.reviews.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                        label: Text('حذف'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: 'Here comment write',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 10),
                      child: Row(
                        children: [
                          Text('Review : ',style: TextStyle(fontWeight: FontWeight.w400),),
                          Row(
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    rating = index + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: (index + 1) <= rating
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: 180,
              //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                  onPressed: () {
                    if (commentController.text.isNotEmpty && rating > 0) {
                      setState(() {
                        widget.reviews.add(
                          Review(
                            username: '',
                            comment: commentController.text,
                            rating: rating,
                          ),
                        );
                        commentController.clear();
                        rating = 0;
                      });
                    }
                  },
                  child: Text('save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // تحديد نصف قطر الدائرة
                      side: BorderSide(color: Colors.grey), // اختيار لون الحدود
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,)
            //////......../////////
          ],
        ),
      ),
    );
  }
}

class Review {
  final String username;
  final String comment;
  final int rating;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
  });
}
