import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cartItems = [];
  double total = 0;

  double addToTotal(Map<String, dynamic> item) {
    final itemTotal = item["quantity"] * item["price"];
    return itemTotal;
  }

  void updateTotal() {
    double t = 0;
    for (var item in cartItems) {
      t += addToTotal(item);
    }
    total = t;
    // notifyListeners();
    print("updt");
  }

  void addCompleteItemToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void increaseItemQuantityToCart(int id) {
    final temp = cartItems.where((element) => element["id"] == id).toList()[0];
    int currentIndex = cartItems.indexOf(temp);
    cartItems.remove(temp);
    temp["quantity"] += 1;
    cartItems.insert(currentIndex, temp);
  }

  void decreaseItemQuantityToCart(int id) {
    final temp = cartItems.where((element) => element["id"] == id).toList()[0];
    int currentIndex = cartItems.indexOf(temp);
    cartItems.remove(temp);
    temp["quantity"] -= 1;
    cartItems.insert(currentIndex, temp);
  }

  void removeCompleteItemFromCart(Map<String, dynamic> item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
