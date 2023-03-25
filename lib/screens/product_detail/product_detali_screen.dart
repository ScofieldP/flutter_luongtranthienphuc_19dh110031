import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/body.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments = ModalRoute.of(context)!.settings.arguments as ProductDetailArguments ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Details"),
      ),
      body: Body(products: arguments.products),
    );
  }
}

class ProductDetailArguments {
  final Products products;

  ProductDetailArguments({required this.products});
}