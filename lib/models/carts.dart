import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'products.dart';

class Cart {
  static List<Products> cart = [];

  void addProductToCart(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cart.add(product);
    List<String> cartJsonList =
        cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
  }

  static List<Products> getCart() {
    return cart;
  }

  static Future<List<Map<String, dynamic>>> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');

    if (cartJson != null) {
      return cartJson
          .map((json) => jsonDecode(json) as Map<String, dynamic>)
          .toList();
    } else {
      return []; // Return a default value for cart
    }
  }

  static Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }
}
