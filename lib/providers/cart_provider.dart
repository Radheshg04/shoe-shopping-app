import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;

  void addProduct(Map<String, dynamic> product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    _cart.remove(product);
    notifyListeners();
  }
}
