import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  // final String token;
  bool isAdmin = false;

  User(
      {required this.id,
      required this.email,
      required this.password,
      // required this.token,
      required this.isAdmin});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      // 'token': token,
      'isAdmin': isAdmin
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      // token: map['token'] ?? '',
      isAdmin: map['isAdmin'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));


}
