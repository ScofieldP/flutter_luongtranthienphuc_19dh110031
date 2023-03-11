import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/register/components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const RegisterForm(),
    );
  }
}
