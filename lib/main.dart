import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/router.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/login_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/register/components/register_form.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/register/register_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LoginScreen(),
    );
  }
}
