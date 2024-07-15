import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/provider/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic>? product;
  const ProductDetailsPage({super.key, this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? currentSize = 0;

  void addItemToCart() {
    Provider.of<CartProvider>(context, listen: false).addCompleteItemToCart({
      ...widget.product!,
      "quantity": 1,
      "currentSize": currentSize,
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.product?["title"];
    final price = widget.product?["price"];
    final sizes = widget.product?["sizes"] as List;
    final imageUrl = widget.product?["imageUrl"];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Details",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            //! Product Image
            const Spacer(),
            Image.asset(
              imageUrl,
              height: 300,
            ),
            const Spacer(),
            Container(
              key: const Key("abc"),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsetsDirectional.only(
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color.fromARGB(226, 240, 240, 240),
              ),
              child: Column(
                children: [
                  //! Product Price
                  Text(
                    "\$ ${price.toString()}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  //! Product Sizes
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        final size = sizes[index];
                        return GestureDetector(
                          onTap: () {
                            if (currentSize == size) {
                              setState(() {
                                currentSize = 0;
                              });
                            } else {
                              setState(() {
                                currentSize = sizes[index];
                              });
                            }
                          },
                          child: Chip(
                            backgroundColor: currentSize == size
                                ? const Color.fromARGB(255, 216, 201, 65)
                                : Colors.transparent,
                            label: Text(size.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  //! Add to Cart
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 216, 201, 65),
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        if (currentSize != 0) {
                          addItemToCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Durations.medium1,
                              content: Text("Added to cart",
                                  style: TextStyle(
                                    color: Colors.green,
                                  )),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Durations.medium1,
                              content: Text(
                                "Select A Size!",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      label: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
