import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/product_popular/services/product_service.dart';

import '../../../../../../../models/products.dart';
import 'components/product_item.dart';

class ProductPopular extends StatefulWidget {
  const ProductPopular({Key? key}) : super(key: key);

  @override
  State<ProductPopular> createState() => _ProductPopularState();
}

class _ProductPopularState extends State<ProductPopular> {
  List<Products>? products;
  final ProductService productService = ProductService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    products = await productService.productPopular(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: const [
              Expanded(child: Text("Popular Products", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
              ),)),
              Text("See more", style: TextStyle(fontSize: 16, color: Colors.lightGreen),),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7
              ),
              itemBuilder: (context, index){
                return ProductItem(
                  product:products![index],
                );
              } ,
            ),
          )
        ],
      ),
    );
  }
}
