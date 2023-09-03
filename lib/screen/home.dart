import 'package:chats/pressention/routes.dart';
import 'package:chats/widget/button.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Image.asset(
                'assets/images/mail-message-sunny-day-logo-vector-4097750.webp'),
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(color: Colors.orangeAccent, title: 'sing in', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.signInScreen);
          }),
          const SizedBox(height: 20,),
          MyButton(color: Colors.blue, title: 'register', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.registrationScreen);

          })

        ],
      ),
    );
  }
}
