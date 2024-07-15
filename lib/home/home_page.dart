import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart/cart_page.dart';
import 'package:shoping_app/home/home_product_list.dart';
import 'package:shoping_app/provider/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cartItems);
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        iconSize: 35,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
    );
  }
}
