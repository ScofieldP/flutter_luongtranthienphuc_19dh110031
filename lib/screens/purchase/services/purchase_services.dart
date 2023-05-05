import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PurchaseServices {
  String uri = Utils.url;

  Future<List<Order>> userOrder({
    required BuildContext context,
  }) async {
    List<Order> orderList = [];
    final userId = Provider.of<UserProvider>(context, listen: false).user.id;
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/order/find/$userId'),
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
            orderList.add(
              Order.fromJson(
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
    return orderList;
  }
}
