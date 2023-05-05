import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/notification/services/notification_channel.dart';
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
    required num total,
    required Map<String, dynamic> shipping,
  }) async {
    final userId = Provider.of<UserProvider>(context, listen: false).user.id;
    try {
      Order order = Order(
          id: "",
          userId: userId,
          products: products,
          // subtotal: subtotal,
          total: total,
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
          String orderId = json.decode(res.body)['_id'];

          final FlutterLocalNotificationsPlugin
              flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          flutterLocalNotificationsPlugin.show(
              0,
              "Food App",
              "Your order with ID ${orderId}\nhas been placed successfully.\nTotal amount: $total",

              NotificationDetails(
                  android: AndroidNotificationDetails(channel.id, channel.name,
                      channelDescription: channel.description,
                      importance: Importance.high,
                      color: Colors.blue,
                      playSound: true,
                      icon: '@mipmap/ic_launcher')));
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
