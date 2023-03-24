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
    return GestureDetector(
      onTap: () {
        // Utils.data.add(product);
        Navigator.pushNamed(context, ProductDetailScreen.routeName,
            arguments: ProductDetailArguments(products: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.image,
            fit: BoxFit.fill,
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
                  product.price.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
