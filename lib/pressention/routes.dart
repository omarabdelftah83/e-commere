import 'package:chats/screen/chatapp.dart';
import 'package:chats/screen/home.dart';
import 'package:chats/screen/register.dart';
import 'package:chats/screen/sing_in.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String signInScreen = '/SignInScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String chatScreen = '/chatScreen';

}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.registrationScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case Routes.chatScreen:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('noRouteFound'),
          ),
        ));
  }
}