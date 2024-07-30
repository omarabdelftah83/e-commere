

import 'package:chats/app/control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Get.put(HomeScreenController());
  runApp(MyApp());
}





class MyApp extends StatefulWidget {
  MyApp._internall();     ///named constractor
  static final MyApp _instance =MyApp._internall();  ///singelton or single instance
  factory MyApp() => _instance;   ///factory
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenarator.getRoute,
        initialRoute: _auth.currentUser != null ? Routes.homePage :  Routes.signInScreen,
        title: 'Flutter Demo',
    );
  }
}
