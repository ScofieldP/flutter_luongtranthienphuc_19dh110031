import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/cart_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/search/search_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
        ),
      ],
    );
  }
}
