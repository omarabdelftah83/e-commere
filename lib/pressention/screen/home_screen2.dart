import 'package:chats/app/routes.dart';
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
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 350,
              child: Image.asset(
                  'assets/images/istockphoto-1281150061-612x612.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(color: Colors.blueGrey, title: 'sing in', onPressed: (){
              Navigator.pushNamed(context, Routes.signInScreen);
            }),
            const SizedBox(height: 20,),
            MyButton(color: Colors.lightBlue, title: 'register', onPressed: (){
              Navigator.pushNamed(context, Routes.registrationScreen);

            })

          ],
        ),
      ),
    );
  }
}
