import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:convert/convert.dart';

class Utils {
  String url = "http://192.168.0.100:3000/api/food";
  static List<Products> data = [];

  Future<List<Products>> getProducts() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var content = res.body;
      var arr = jsonDecode(content)['food'] as List;
      return arr.map((e) => _fromJson(e)).toList();
    }
    return <Products>[];
  }

  Products _fromJson(Map<String, dynamic> item) {
    return Products(
        title: item['title'],
        description: item['description'],
        image: item['image'],
        price: double.parse(item['price']),
        id: item['id']);
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter email";
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    }
    if (value.length < 8) {
      return "Password more than 8 characters";
    } else {
      return null;
    }
  }

  static bool equalsIgnoreCase(String? a, String? b) =>
      (a == null && b == null) ||
      (a != null && b != null && a.toLowerCase() == b.toLowerCase());

  static String? confirmPassword(String password, String confirmPassword) {
    if (!equalsIgnoreCase(password, confirmPassword)) {
      return "Confirm password invalid";
    }
    return null;
  }
}
