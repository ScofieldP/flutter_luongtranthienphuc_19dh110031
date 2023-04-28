import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/carts.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/cart_item.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/check_out_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/products.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartDetail = Cart.getCart();
  double sum = 0.0;

  Future<void> removeProductFromCart(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Xóa sản phẩm ra khỏi giỏ hàng
    cartDetail.remove(product);
    List<String> cartJsonList =
        cartDetail.map((p) => json.encode(p.toMap())).toList();

    // Cập nhật lại danh sách sản phẩm trong SharedPreferences
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);

    // Xóa key tương ứng trong SharedPreferences
    await prefs.remove(product.id);

    // Tính lại tổng giá trị sản phẩm trong giỏ hàng và cập nhật giao diện
    double newSum = 0.0;
    cartDetail.forEach((element) {
      newSum += element.totalPrice;
    });
    setState(() {
      cartDetail.remove(product);
      sum = newSum;
    });
  }

  @override
  void initState() {
    super.initState();
    Cart.loadCart().then((cartJson) {
      setState(() {
        cartDetail = cartJson.map((json) => Products.fromMap(json)).toList();
        for (var element in cartDetail) {
          sum = sum + element.totalPrice;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: cartDetail.isEmpty
          ? Center(
              child: Text('Cart is empty :('),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartDetail.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            child: CartItem(
                              products: cartDetail[index],
                              onQuantityChanged: () {
                                setState(() {
                                  sum = 0.0;
                                  cartDetail.forEach((element) {
                                    sum += element.price * element.quantity;
                                  });
                                });
                              },
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirm'),
                                    content: const Text(
                                        "Do you want to remove this product from your cart?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          await removeProductFromCart(
                                              cartDetail[index]);
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
                CheckOutCart(sum: sum)
              ],
            ),
    );
  }
}
