import 'package:chats/widget/eleveted_button.dart';
import 'package:flutter/material.dart';

import '../../app/routes.dart';

class ComparePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //   Center(child: Image.asset('assets/images.png')),
                Container(
                  width: 200,
                  child: Image.asset(
                      'assets/images/images.png'),
                ),
                const SizedBox(
                  height: 80,
                ),
                RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome To E comm',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'erce',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Text('\n your journey starts from here',
                    style: TextStyle(color: Colors.black38)),
                const SizedBox(
                  height: 40,
                ),


                ElevaatedButton(backgroundColor1: Colors.black,
                    backgroundColor2: Colors.white,
                    textColor: Colors.grey,
                    title: 'Find a Service',
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.home,);
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevaatedButton(backgroundColor1: Colors.blue,
                    backgroundColor2: Colors.white,
                    textColor: Colors.grey,
                    title: 'Become a Seller',
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.Seller,);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
