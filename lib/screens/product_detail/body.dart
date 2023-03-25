import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/components/add_product_to_cart.dart';

class Body extends StatelessWidget {
  final Products products;
  const Body({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Image.network(products.image),
        ),
        const SizedBox(height: 20,),
        Expanded(flex: 1,child: Text("Description: ${products.description}"),),
        AddProductToCart(products: products)
      ],
    ),);
  }
}
