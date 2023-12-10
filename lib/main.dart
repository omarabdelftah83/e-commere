// import 'package:chats/app/control.dart';
// import 'package:chats/app/routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   final _auth = FirebaseAuth.instance;
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenController());
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: RouteGenarator.getRoute,
//       initialRoute: _auth.currentUser !=null ? Routes.HomeScreen : Routes.ComparePage,
//      // initialRoute:Routes.ComparePage,
//       title: 'Flutter Demo',
//
//     );
//   }
// }


//
//
// import 'package:flutter/material.dart';
// import 'package:chats/app/control.dart';
// import 'package:chats/app/routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   // Initialize and register HomeScreenController
//   Get.put(HomeScreenController());
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: RouteGenarator.getRoute,
//       initialRoute: _auth.currentUser != null ? Routes.HomeScreen : Routes.ComparePage,
//       title: 'Flutter Demo',
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/control.dart';
import 'app/routes.dart';
import 'controller/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeScreenController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentDetailsProvider()),
        ChangeNotifierProvider(create: (_) => CreditCardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenarator.getRoute,
        initialRoute: _auth.currentUser != null ? Routes.HomeScreen : Routes.ComparePage,
        title: 'Flutter Demo',
      ),
    );
  }
}