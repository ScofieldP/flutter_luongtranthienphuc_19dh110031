import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/product_detali_screen.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // if (product.image!=null){
    //
    // }
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  arguments: ProductDetailsArguments(product: product));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Text(product.title)),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.green),
                      child: Text(
                        product.price.toDouble().toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
