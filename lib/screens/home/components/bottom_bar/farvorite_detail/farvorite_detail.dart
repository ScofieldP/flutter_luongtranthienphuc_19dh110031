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
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
        _favoriteProducts = _loadFavoriteProducts();
      });
    });
  }

  List<Products> _loadFavoriteProducts() {
    return _prefs.getKeys().where((key) => _prefs.getBool(key) ?? false).map((key) {
      final productId = int.parse(key);
      return Products(
        id: productId.toString(),
        title: _prefs.getString('$productId.title') ?? '',
        description: _prefs.getString('$productId.description') ?? '',
        price: _prefs.getDouble('$productId.price') ?? 0.0,
        image: _prefs.getString('$productId.image') ?? '',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: _favoriteProducts.isEmpty
          ? Center(child: Text('No favorites yet'))
          : GridView.count(
        crossAxisCount: 2,
        children: _favoriteProducts.map((product) {
          return ProductItem(product: product);
        }).toList(),
      ),
    );
  }
}

