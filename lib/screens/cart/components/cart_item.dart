import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';

class CartItem extends StatefulWidget {
  final Products products;
  final Function()? onQuantityChanged;

  const CartItem({Key? key, required this.products, this.onQuantityChanged})
      : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  num updateTotal() {
    num totalPrice = widget.products.price * widget.products.quantity;
    return totalPrice;
  }

  void incrementQuantity() {
    setState(() {
      widget.products.quantity++;
    });
    widget.onQuantityChanged?.call();
  }

  void decrementQuantity() {
    setState(() {
      if (widget.products.quantity > 1) {
        widget.products.quantity--;
      }
    });
    widget.onQuantityChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(widget.products.image ?? ""),
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(widget.products.title),
                Row(children: [
                  Text(widget.products.price.toStringAsFixed(2)),
                ])
              ])),

          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementQuantity,
                ),
                Text(widget.products.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementQuantity,
                ),
              ],
            ),
          ),
          // Expanded(child: Text(widget.products.price.toString())),
          Icon(
            Icons.delete_outlined,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
