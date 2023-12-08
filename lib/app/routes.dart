import 'package:chats/pressention/screen/become_seller.dart';
import 'package:chats/pressention/screen/cart/shopping_cart.dart';
import 'package:chats/pressention/screen/chatapp.dart';
import 'package:chats/pressention/screen/compare_screen1.dart';
import 'package:chats/pressention/screen/diplay_screen3.dart';
import 'package:chats/pressention/screen/home_screen2.dart';
import 'package:chats/pressention/screen/payment/my_cart_view.dart';
import 'package:chats/pressention/screen/register.dart';
import 'package:chats/pressention/screen/sing_in.dart';

import 'package:flutter/material.dart';
import '../pressention/screen/payment/payment_details.dart';
import '../pressention/screen/payment/thank_you.dart';
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
  static const String MyCartView = '/MyCartView';
  static const String PaymentDetails = '/PaymentDetails';
  static const String ThankYou = '/ThankYou';





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
      case Routes.MyCartView:
        return MaterialPageRoute(builder: (_) => MyCartView());
      case Routes.PaymentDetails:
        return MaterialPageRoute(builder: (_) => PaymentDetails());
      case Routes.ThankYou:
        return MaterialPageRoute(builder: (_) => ThankYou());



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
