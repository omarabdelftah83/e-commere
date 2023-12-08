import 'package:get/get.dart';

import '../model/entity.dart';

class HomeScreenController extends GetxController{
  List<Product>cartProduct=[];
  int cartCount=0;
  addToCart(product){
    cartProduct.add(product);
    cartCount ++;
    print(cartProduct.length);
    update();
  }
  removeToCart(product){
    print(cartProduct.length);
    cartCount --;
    cartProduct.remove(product);
    update();
  }
}