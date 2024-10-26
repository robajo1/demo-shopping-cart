import 'package:flutter/material.dart';
import 'package:shopping_cart/model/productDetail.dart';

class Cartprovider extends ChangeNotifier {
  List<Productdetail> cart = [];
  add(Productdetail value) {
    cart.add(value);
    notifyListeners();
  }

  remove(Productdetail value) {
    cart.remove(value);
    notifyListeners();
  }

  empty() {
    cart.clear();
    notifyListeners();
  }

  int size() {
    return cart.length;
  }
}
