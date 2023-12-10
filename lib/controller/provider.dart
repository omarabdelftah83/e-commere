import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
class PaymentDetailsProvider extends ChangeNotifier {
  int activeIndex = -1;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void updateActiveIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  void updateAutovalidateMode(AutovalidateMode mode) {
    autovalidateMode = mode;
    notifyListeners();
  }

}




class CreditCardProvider extends ChangeNotifier {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  void updateCreditCardDetails(CreditCardModel updatedModel) {
    cardHolderName = updatedModel.cardHolderName;
    expiryDate = updatedModel.expiryDate;
    cvvCode = updatedModel.cvvCode;
    cardNumber = updatedModel.cardNumber;
   // showBackView = updatedModel.showBackView;
    notifyListeners();
  }
}

