
import 'package:flutter/material.dart';

class StackImage extends StatelessWidget {
  const StackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 377,
          width: 524,
          child: Expanded(child: Image.asset('assets/images/15549540_5623839 2.png',)),
        ),
        Positioned(
          top: 70,
          left: 110,
          child: Image.asset(
            'assets/images/image 11.png',
            width: 96, // ضبط الحجم حسب الحاجة
            height: 110,
          ),
        ),
        Positioned(
          top: 190,
          left: 110,
          child: Image.asset(
            'assets/images/image 10.png',
            width: 130.34,
            height: 110.66,
          ),
        ),
        Positioned(
          top: 150,
          right: 80,
          child: Image.asset(
            'assets/images/Dinoshapes_Book_1200x1000.png',
            width: 110.34,
            height: 80.66,
          ),
        ),


      ],
    );
  }
}
