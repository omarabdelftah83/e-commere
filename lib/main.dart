import 'package:chats/pressention/routes.dart';
import 'package:chats/screen/chatapp.dart';
import 'package:chats/screen/home.dart';
import 'package:chats/screen/register.dart';
import 'package:chats/screen/sing_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return  MaterialApp(
      onGenerateRoute: RouteGenarator.getRoute,
      initialRoute: _auth.currentUser !=null ? Routes.chatScreen : Routes.home,
      title: 'Flutter Demo',

    );
  }
}
