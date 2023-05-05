
import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/cart_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/home_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/login/login_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/product_detali_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/purchase/components/shipping_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/register/register_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/search/search_screen.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SearchScreen.routeName:(context) => const SearchScreen(),
  ShippingDetail.routeName: (context, {RouteSettings? settings}) {
    var order = settings?.arguments as Order;
    return ShippingDetail(order: order);
  },
};
