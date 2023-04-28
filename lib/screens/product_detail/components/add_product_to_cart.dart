import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/carts.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProductToCart extends StatefulWidget {
  final Products products;
  final int quantity;

  const AddProductToCart({Key? key, required this.products, required this.quantity})
      : super(key: key);

  @override
  State<AddProductToCart> createState() => _AddProductToCartState();
}

class _AddProductToCartState extends State<AddProductToCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          final productWithQuantity = widget.products.copyWith(quantity: widget.quantity);
          Cart.addProductToCart(productWithQuantity);
          Fluttertoast.showToast(
              msg: "Add to cart",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.orangeAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Add to cart".toUpperCase(),
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
