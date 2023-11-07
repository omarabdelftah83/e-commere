import 'package:chats/pressention/control.dart';
import 'package:chats/pressention/routes.dart';
import 'package:chats/screen/home2_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenarator.getRoute,
     initialRoute: _auth.currentUser !=null ? Routes.HomeScreen : Routes.ComparePage,
     // initialRoute:Routes.ComparePage,
      title: 'Flutter Demo',

    );
  }
}
