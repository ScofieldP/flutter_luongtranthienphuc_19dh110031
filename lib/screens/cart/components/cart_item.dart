import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';

class CartItem extends StatelessWidget {
  final Products products;
  
  const CartItem({Key? key, required this.products}) : super(key: key);

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
            child: Image.network(products.image ?? ""),
          ),
          Expanded(child: Text(products.title)),
          Expanded(child: Text(products.price.toString())),
          // Expanded(child: Text(products.image)),

          const Icon(Icons.delete_outlined)
        ],
      ),
    );
  }
}
