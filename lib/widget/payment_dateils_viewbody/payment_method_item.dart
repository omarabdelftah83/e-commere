import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    Key? key,
    required this.image,
     this.isActive=false,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 103,
          height: 62,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5,
                color: isActive ? const Color(0xFF34A853) : Colors.blue,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: isActive ? Color(0xFF34A853) : Colors.white54,
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Container(child: Image.asset(image)),
        ),
      ),
    );
  }
}