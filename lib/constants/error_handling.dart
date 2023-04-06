import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/error_handling.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/constants/utils.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      Utils.showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      Utils.showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      Utils.showSnackBar(context, response.body);
  }
}
