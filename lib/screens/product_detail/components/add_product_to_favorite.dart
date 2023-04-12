import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProductToFavorite extends StatefulWidget {
  final Products products;

  const AddProductToFavorite({Key? key, required this.products})
      : super(key: key);

  @override
  State<AddProductToFavorite> createState() => _AddProductToFavoriteState();
}

class _AddProductToFavoriteState extends State<AddProductToFavorite> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: isLiked ? "Removed from favorites" : "Added to favorites",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          setState(() {
            isLiked = !isLiked;
          });
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.green,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            isLiked
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                isLiked ? "Removed from favorites".toUpperCase() : "Add to favorites".toUpperCase(),
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
