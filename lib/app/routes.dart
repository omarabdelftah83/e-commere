import 'package:chats/auth/forget_password/forget_password_page.dart';
import 'package:chats/auth/verification/otp_page.dart';
import 'package:chats/home/presetion/home_page.dart';
import 'package:chats/pressention/screen/become_seller.dart';
import 'package:chats/pressention/screen/cart/shopping_cart.dart';
import 'package:chats/pressention/screen/chatapp.dart';
import 'package:chats/pressention/screen/diplay_screen3.dart';
import 'package:chats/pressention/screen/payment/my_cart_view.dart';
import 'package:chats/auth/register/register_page.dart';
import 'package:chats/auth/sing_in/sing_in_page.dart';

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
  static const String homePage = '/HomePage';
  static const String shoppingCart = '/shoppingCart';
  static const String forGetPassword = '/forGetPassword';
  static const String Seller = '/Seller';
  static const String MyCartView = '/MyCartView';
  static const String PaymentDetails = '/PaymentDetails';
  static const String otpPage = '/otpPage';





}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.forGetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());

      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case Routes.registrationScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case Routes.HomeBody:
        return MaterialPageRoute(builder: (_) => HomeBody());
      case Routes.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.shoppingCart:
        return MaterialPageRoute(builder: (_) => ShoppingCart());
      case Routes.Seller:
        return MaterialPageRoute(builder: (_) => Seller());
      case Routes.MyCartView:
        return MaterialPageRoute(builder: (_) => MyCartView());
      case Routes.PaymentDetails:
        return MaterialPageRoute(builder: (_) => PaymentDetails());
      case Routes.otpPage:
        return MaterialPageRoute(builder: (_) => VerifyPage(verificationId: 'your_verification_id_here'));




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
