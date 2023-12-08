//
// import 'package:flutter/material.dart';
//
// class TextFailed extends StatelessWidget {
//   const TextFailed({super.key, required this.color, required this.title, required this.onPressed});
//   final Color color;
//   final String title;
//   final VoidCallback onPressed;  @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: TextInputType.emailAddress,
//       textAlign: TextAlign.center,
//       onChanged: (value) {
//         email = value;
//       },
//       decoration: const InputDecoration(
//         hintText: 'Enter your Email',
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 20,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.blueGrey,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.blueGrey,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }
