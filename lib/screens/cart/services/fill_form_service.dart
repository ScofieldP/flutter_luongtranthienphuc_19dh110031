import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/carts.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/user_provider.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FillFormService {
  String uri = Utils.url;

  void fillForm({
    required BuildContext context,
    required List<Map<String, dynamic>> products,
    // required double subtotal,
    // required double total,
    required Map<String, dynamic> shipping,
  }) async {
    final userId = Provider.of<UserProvider>(context,listen: false).user.id;
    try {
      Order order = Order(
          userId: userId,
          products: products,
          // subtotal: subtotal,
          // total: total,
          shipping: shipping);
      http.Response res = await http.post(
        Uri.parse('$uri/api/order'),
        body: order.toJson(),
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
        onSuccess: () async {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
                (route) => false,
          );
          Utils.showSnackBar(context, "Đơn đặt hàng thành công");
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
