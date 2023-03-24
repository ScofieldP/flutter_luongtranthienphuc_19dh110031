import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/carts.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/cart_item.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/check_out_cart.dart';

import '../../models/products.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartDetail = Cart.getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    for (var element in cartDetail) {
      sum = sum + element.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
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
                      ),
                      onTap: () {
                        setState(
                          () {
                            cartDetail.removeAt(index);
                            sum = 0.0;
                            cartDetail.forEach((element) {
                              sum = sum + element.price;
                            });
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
