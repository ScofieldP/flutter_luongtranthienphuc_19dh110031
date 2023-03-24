import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/routes.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/body.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/home_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/header/home_header.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/home_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/login_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/product_detali_screen.dart';
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
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          // color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        )

      ),

      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
