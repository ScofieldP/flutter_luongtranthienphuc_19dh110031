import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/categories.dart';

class CategoriesItem extends StatelessWidget {
  final Categories category;

  const CategoriesItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(5),
      child: Image.asset(category.image),
    );
  }
}
