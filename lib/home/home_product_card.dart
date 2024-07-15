import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic>? product;
  const ProductCard({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final id = product?["id"];
    final title = product?["title"];
    final price = product?["price"];
    final imageUrl = product?["imageUrl"];

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: id % 2 == 0
            ? const Color.fromARGB(226, 240, 240, 240)
            : const Color.fromRGBO(209, 237, 251, 1),
        border: Border.all(
          color: id % 2 == 0
              ? const Color.fromARGB(226, 240, 240, 240)
              : const Color.fromRGBO(209, 237, 251, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$ ${price.toString()}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              imageUrl,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
