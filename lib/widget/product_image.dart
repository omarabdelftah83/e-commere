import 'package:flutter/material.dart';
class ProductImage extends StatelessWidget {
  const ProductImage({required this.size, required this.image, super.key});

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // alignment: Alignment.bottomCenter,
          decoration:
          BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          height: size.width * 0.6,
          width: size.width * 0.6,
        ),
        Image.asset(
          image,
          height: size.width * 0.55,
          width: size.width * 0.55,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}