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
import '../dashbord/dashbord.dart';
import '../pressention/screen/payment/payment_details.dart';
import '../pressention/screen/payment/thank_you.dart';
import '../widget/home_body.dart';
class Routes {
  static const String home = '/';
  static const String signInScreen = '/SignInScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String homeBody = '/HomeBody';
  static const String chat = '/chat';
  static const String homeScreen = '/HomeScreen';
  static const String shoppingCart = '/shoppingCart';
  static const String comparePage = '/ComparePage';
  static const String seller = '/Seller';
  static const String myCartView = '/MyCartView';
  static const String paymentDetails = '/PaymentDetails';
  static const String thankYou = '/ThankYou';
  static const String dashBord = '/DashBord';





}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.registrationScreen:
        return MaterialPageRoute(builder: (_) =>const RegistrationScreen());
      case Routes.homeBody:
        return MaterialPageRoute(builder: (_) =>const HomeBody());
      case Routes.chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.shoppingCart:
        return MaterialPageRoute(builder: (_) => ShoppingCart());
      case Routes.comparePage:
        return MaterialPageRoute(builder: (_) => ComparePage());
      case Routes.seller:
        return MaterialPageRoute(builder: (_) => Seller());
      case Routes.myCartView:
        return MaterialPageRoute(builder: (_) => const  MyCartView());
      case Routes.paymentDetails:
        return MaterialPageRoute(builder: (_) => const  PaymentDetails());
      case Routes.thankYou:
        return MaterialPageRoute(builder: (_) => const ThankYou());
      case Routes.dashBord:
        return MaterialPageRoute(builder: (_) => const DashBord());



      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title:const Text('noRouteFound'),
          ),
        ));
  }}
