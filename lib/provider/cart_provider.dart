import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cartItems = [];

  void addCompleteItemToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeCompleteItemFromCart(Map<String, dynamic> item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
