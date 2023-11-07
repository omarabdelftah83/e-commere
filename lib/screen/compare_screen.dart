import 'package:flutter/material.dart';

import '../pressention/routes.dart';

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
                Container(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.home,);

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        // لون الخلفية للزر
                        onPrimary: Colors.white,
                        // لون النص على الزر
                        onSurface: Colors.grey,
                        // لون النص عند تمرير الماوس أو اللمس بالزر
                        padding: const EdgeInsets.all(16),
                        // هوامش داخلية للزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // شكل الزر
                        ),
                      ),
                      child: const Text('Find a Service')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.Seller,);

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        // لون الخلفية للزر
                        onPrimary: Colors.white,
                        // لون النص على الزر
                        onSurface: Colors.grey,
                        // لون النص عند تمرير الماوس أو اللمس بالزر
                        padding: const EdgeInsets.all(16),
                        // هوامش داخلية للزر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // شكل الزر
                        ),
                      ),
                      child: const Text('Become a Seller')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
