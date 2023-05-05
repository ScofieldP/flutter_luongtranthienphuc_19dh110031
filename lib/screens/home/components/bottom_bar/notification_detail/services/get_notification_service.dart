import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/notification.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class GetNotificationService{
  String uri = Utils.url;

  Future<List<NotificationModel>> fetchUserNotification({
    required BuildContext context,
  }) async {
    List<NotificationModel> notificationList = [];
    final userId = Provider.of<UserProvider>(context, listen: false).user.id;

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/notification/find/$userId'),
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
            notificationList.add(
                NotificationModel.fromJson(
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
    return notificationList;
  }
}