import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cartItems = [
    // {
    //   "id": 5,
    //   "title": "Men's Hawaii Shoes",
    //   "price": 40.0,
    //   "sizes": [7, 8, 9, 10],
    //   "imageUrl": 'assets/images/shoes_4.png',
    //   "quantity": 2,
    //   "currentSize": 9,
    // },
    // {
    //   "id": 4,
    //   "title": "Men's Bata Shoes",
    //   "price": 14.0,
    //   "sizes": [7, 8, 9, 10],
    //   "imageUrl": 'assets/images/shoes_1.png',
    //   "quantity": 1,
    //   "currentSize": 7,
    // },
  ];

  void addCompleteItemToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeCompleteItemFromCart(Map<String, dynamic> item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
