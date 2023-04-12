import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user =
  User(id: '',
      email: '',
      password: '',
      // token: '',
      isAdmin: false);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
    }
}
