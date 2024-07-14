import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoping_app/cart/cart_page.dart';
import 'package:shoping_app/global_variables.dart';
import 'package:shoping_app/home/product_card.dart';
import 'package:shoping_app/product%20details/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Puma",
    "Bata",
    "Hawaii",
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //! Header
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Text(
                    "Shopping\nApp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const CartPage();
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.trolley,
                          size: 40,
                        ),
                        Text(
                          "My Cart (${cart.length})",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
            //! Items Category
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        // backgroundColor: ,
                        backgroundColor: filter == selectedFilter
                            ? const Color.fromARGB(255, 216, 201, 65)
                            : const Color.fromARGB(226, 240, 240, 240),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(255, 231, 241, 255),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        label: Text(
                          filter,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // GAP
            const SizedBox(
              height: 20,
            ),
            //! Product Cards
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsPage(
                              product: product,
                            );
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      product: product,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
