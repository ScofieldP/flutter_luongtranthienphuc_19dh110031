import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'products.dart';

class Cart {
  static List<Products> cart = [];

  static Future<void> updateCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJsonList =
        cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);
  }

  static Future<void> addProductToCart(Products product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if the product already exists in the cart
    int index = cart.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      // If it does, update the quantity and total amount
      cart[index].quantity += product.quantity;
      cart[index].totalPrice = cart[index].quantity * cart[index].price;
    } else {
      // calculate the price and total price for the first time
      product.totalPrice = product.quantity * product.price;
      cart.add(product);
    }

    List<String> cartJsonList =
    cart.map((p) => json.encode(p.toMap())).toList();
    await prefs.setStringList('cart', cartJsonList);
    print(cartJsonList);

    await updateCart();
  }

  static List<Products> getCart() {
    return cart;
  }

  static Future<List<Map<String, dynamic>>> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');

    if (cartJson != null) {
      cart =
          cartJson.map((json) => Products.fromMap(jsonDecode(json))).toList();
      return cartJson
          .map((json) => jsonDecode(json) as Map<String, dynamic>)
          .toList();
    } else {
      return []; // Return a default value for cart
    }
  }
}
