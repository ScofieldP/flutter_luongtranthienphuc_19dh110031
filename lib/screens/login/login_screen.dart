import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/components/footer_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/components/header_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScreen(context),
            const LoginForm(),
            FooterScreen(context)
          ],
        ),
      )),
    );
  }
}
