import 'package:flutter/material.dart';
import 'package:shoping_app/cart/cart_item.dart';
import 'package:shoping_app/cart/cart_total.dart';
import 'package:shoping_app/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;

  void _removeItemFromCart(int id) {
    setState(() {
      cart.removeWhere((item) => item['id'] == id);
    });
  }

  void _decreaseItemQuantityIntoCart(int id) {
    setState(() {
      final c = cart.where((item) => item['id'] == id);
      final d = c.toList()[0];
      int currentIndex = cart.indexOf(d);
      d["quantity"] -= 1;
      cart.removeWhere((item) => item['id'] == id);
      cart.insert(currentIndex, d);
    });
  }

  void _increaseItemQuantityIntoCart(int id) {
    setState(() {
      final c = cart.where((item) => item['id'] == id);
      final d = c.toList()[0];
      int currentIndex = cart.indexOf(d);
      d["quantity"] += 1;
      cart.removeWhere((item) => item['id'] == id);
      cart.insert(currentIndex, d);
    });
  }

  void _addToTotal(double value) {
    setState(() {
      total += value;
    });
  }

  void _removeToTotal(double value) {
    if (total >= 0) {
      setState(() {
        total -= value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/512/11329/11329060.png",
                    height: 200,
                  ),
                  const Text(
                    "GAREEEBBBBBB!!",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                    "Yeh Cart bhi teri zindagi ki tarah khaaliii haii🫠",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            final currentItem = cart[index];
                            return CartItem(
                              product: currentItem,
                              onRemoveCompleteItem: _removeItemFromCart,
                              onAddItemQuantity: _increaseItemQuantityIntoCart,
                              onRemoveItemQuantity:
                                  _decreaseItemQuantityIntoCart,
                              updateTotal: _addToTotal,
                              removeTotal: _removeToTotal,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CartTotal(total: total),
              ],
            ),
    );
  }
}
