import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/provider/cart_provider.dart';

class CartItem extends StatefulWidget {
  final Map<String, dynamic>? product;

  const CartItem({
    super.key,
    this.product,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void onTap() {
    Provider.of<CartProvider>(context)
        .removeCompleteItemFromCart(widget.product!);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.product?["title"];
    final price = widget.product?["price"] as double;
    final imageUrl = widget.product?["imageUrl"];
    final currentSize = widget.product?["currentSize"];
    int quantity = widget.product?["quantity"];
    double productTotal = price * quantity;
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(226, 240, 240, 240),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.red),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          // ! CELL 1 FOR IMAGE
          Image.asset(
            imageUrl,
            width: 150,
            height: 150,
          ),
          // ! CELL 2 FOR TITLE,PRICE AND QUANTITY
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // p name
                  Text("$title, Size ${currentSize.toString()}"),
                  // p price
                  Text("\$ $price"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // minus
                      RawMaterialButton(
                        fillColor: Colors.red,
                        shape: const CircleBorder(),
                        onPressed: () {
                          setState(() {
                            quantity--;
                          });
                          if (quantity >= 1) {
                            // widget.onRemoveItemQuantity(id);
                          } else {
                            // widget.onRemoveCompleteItem(id);
                          }
                          // widget.removeTotal(price * quantity);
                        },
                        child: const Icon(Icons.remove),
                      ),
                      //item count
                      Text(quantity.toString()),
                      RawMaterialButton(
                        fillColor: Colors.red,
                        shape: const CircleBorder(),
                        onPressed: () {
                          // widget.onAddItemQuantity(id);
                          setState(() {
                            quantity++;
                          });
                          // widget.updateTotal(price * quantity);
                        },
                        child: const Icon(Icons.add),
                      ),
                      // plus
                    ],
                  )
                ],
              ),
            ),
          ),
          // ! CELL3 FOR TOTAL  FOR THIS PARTICULAR PRODUCT
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "\$ ${productTotal.toStringAsPrecision(3)}",
            ),
          ),
        ],
      ),
    );
  }
}
