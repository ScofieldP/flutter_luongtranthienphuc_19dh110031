import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:http/http.dart' as http;


class ProductService {
  String uri = Utils.url;

  Future<List<Products>> productPopular({
    required BuildContext context,
  }) async {
    List<Products> productList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/food'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Products.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
    return productList;
  }
}
