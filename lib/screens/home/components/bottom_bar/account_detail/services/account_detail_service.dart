import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/user.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';

class AccountDetailService {
  String uri = Utils.url;

  void updateInfo({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final userId = Provider.of<UserProvider>(context, listen: false).user.id;
    // final salt = await FlutterBcrypt.salt();
    // final hashedPassword = await FlutterBcrypt.hashPw(password:password, salt:salt);

    try {
      User user = User(
          id: userId,
          email: email,
          password: password  ,
          // token: '',
          isAdmin: false);
      http.Response res = await http.put(
        Uri.parse('$uri/api/user/$userId'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          Utils.showSnackBar(
            context,
            'Thay đổi thông tin thành công',
          );
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
