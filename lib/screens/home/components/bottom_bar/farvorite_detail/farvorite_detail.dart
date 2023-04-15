import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/product_popular/components/product_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteDetail extends StatefulWidget {
  const FavoriteDetail({Key? key}) : super(key: key);

  @override
  State<FavoriteDetail> createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  late SharedPreferences _prefs;
  List<Products> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = _prefs.getStringList('favorite');
    if (favoriteJsonList != null) {
      _favoriteProducts = favoriteJsonList
          .map((json) => Products.fromMap(jsonDecode(json)))
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _favoriteProducts.isEmpty
          ? Center(child: Text('No favorites yet'))
          : Container(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: _favoriteProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return ProductItem(
              product: _favoriteProducts[index],
            );
          },
        ),
      ),
    );
  }
}
