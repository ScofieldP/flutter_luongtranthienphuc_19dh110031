import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/categories_store/categories_store.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/product_popular/product_popular.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [CategoriesStore(), ProductPopular()],
      ),
    );
  }
}
