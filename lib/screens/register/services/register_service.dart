import 'package:flutter/cupertino.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bcrypt/flutter_bcrypt.dart';

class RegisterService {
  String uri = Utils.url;

  void registerUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {

      User user = User(
          id: '',
          email: email,
          password: password, // Use hashed password
          // token: ''
          isAdmin: false);
      http.Response res = await http.post(
        Uri.parse('$uri/api/auth/register'),
        body: user.toJson(),
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
          Utils.showSnackBar(
            context,
            'Đăng kí thành công',
          );
        },
      );
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      print(e);
    }
  }
}
