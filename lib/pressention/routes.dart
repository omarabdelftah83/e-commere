import 'package:chats/screen/chatapp.dart';
import 'package:chats/screen/home.dart';
import 'package:chats/screen/register.dart';
import 'package:chats/screen/sing_in.dart';
import 'package:flutter/material.dart';

import '../screen/become_seller.dart';
import '../screen/compare_screen.dart';
import '../screen/home2_screen.dart';
import '../screen/cart/shopping_cart.dart';
import '../widget/home_body.dart';

class Routes {
  static const String home = '/';
  static const String signInScreen = '/SignInScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String HomeBody = '/HomeBody';
  static const String chat = '/chat';
  static const String HomeScreen = '/HomeScreen';
  static const String shoppingCart = '/shoppingCart';
  static const String ComparePage = '/ComparePage';
  static const String Seller = '/Seller';



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
      case Routes.HomeBody:
        return MaterialPageRoute(builder: (_) => HomeBody());
      case Routes.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case Routes.HomeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.shoppingCart:
        return MaterialPageRoute(builder: (_) => ShoppingCart());
      case Routes.ComparePage:
        return MaterialPageRoute(builder: (_) => ComparePage());
      case Routes.Seller:
        return MaterialPageRoute(builder: (_) => Seller());

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
  }}
