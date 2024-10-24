import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier {
  List cart = [];
  add(var value) {
    cart.add(value);
    notifyListeners();
  }

  remove(var value) {
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
