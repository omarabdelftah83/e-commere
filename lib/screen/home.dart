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
            height: 300,
            child: Image.asset(
                'assets/images/istockphoto-1300338138-612x612y.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(color: Colors.purpleAccent, title: 'sing in', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.signInScreen);
          }),
          const SizedBox(height: 20,),
          MyButton(color: Colors.blueAccent, title: 'register', onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.registrationScreen);

          })

        ],
      ),
    );
  }
}
