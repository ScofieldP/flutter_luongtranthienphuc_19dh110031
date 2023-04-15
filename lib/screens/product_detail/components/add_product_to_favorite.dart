import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductToFavorite extends StatefulWidget {
  final Products products;

  const AddProductToFavorite({Key? key, required this.products})
      : super(key: key);

  @override
  State<AddProductToFavorite> createState() => _AddProductToFavoriteState();
}

class _AddProductToFavoriteState extends State<AddProductToFavorite> {
  late SharedPreferences _prefs;
  bool _isLiked = false;
  List<Products> _favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _initIsLiked();
  }

  Future<void> _initIsLiked() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJsonList = _prefs.getStringList('favorite');
    if (favoriteJsonList != null) {
      List<Products> favoriteList = favoriteJsonList
          .map((json) => Products.fromMap(jsonDecode(json)))
          .toList();
      _isLiked = favoriteList.any((p) => p.id == widget.products.id);
    }
    setState(() {});
  }

  Future<void> _toggleIsLiked() async {
    setState(() {
      _isLiked = !_isLiked;
    });
    List<String> favoriteJsonList =
        _prefs.getStringList('favorite') ?? <String>[];
    List<Products> favoriteList = favoriteJsonList
        .map((json) => Products.fromMap(jsonDecode(json)))
        .toList();
    if (_isLiked) {
      favoriteList.add(widget.products);
    } else {
      favoriteList.removeWhere((p) => p.id == widget.products.id);
    }
    favoriteJsonList = favoriteList.map((p) => json.encode(p.toMap())).toList();
    await _prefs.setStringList('favorite', favoriteJsonList);

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () async {
          await _toggleIsLiked();
          Fluttertoast.showToast(
              msg: _isLiked ? "Added to favorites" : "Removed from favorites",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.green,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _isLiked
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                _isLiked
                    ? "Remove from favorites".toUpperCase()
                    : "Add to favorites".toUpperCase(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
