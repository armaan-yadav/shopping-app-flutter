import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart/cart_item.dart';
import 'package:shoping_app/cart/cart_total.dart';
import 'package:shoping_app/provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context).updateTotal();
    final total = context.watch<CartProvider>().total;
    final cartItems = context.watch<CartProvider>().cartItems;
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
      body: cartItems.isEmpty
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
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final currentItem = cartItems[index];
                            return CartItem(
                              product: currentItem,
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
