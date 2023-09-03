import 'package:chats/pressention/routes.dart';
import 'package:chats/screen/chatapp.dart';
import 'package:chats/screen/home.dart';
import 'package:chats/screen/register.dart';
import 'package:chats/screen/sing_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenarator.getRoute,
      initialRoute: Routes.home,
      title: 'Flutter Demo',

    );
  }
}
