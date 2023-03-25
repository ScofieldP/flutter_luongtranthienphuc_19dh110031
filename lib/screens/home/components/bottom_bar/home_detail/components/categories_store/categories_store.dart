import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/categories.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/categories_store/services/categories_service.dart';

import 'components/categories_item.dart';

class CategoriesStore extends StatefulWidget {
  const CategoriesStore({Key? key}) : super(key: key);

  @override
  State<CategoriesStore> createState() => _CategoriesStoreState();
}

class _CategoriesStoreState extends State<CategoriesStore> {
  List<Categories>? categories;
  final CategoriesService categoriesService = CategoriesService();

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    categories = await categoriesService.categoriesStore(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
                Text(
                  "See more",
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories!.length,
                itemBuilder: (context, index) {
                  return CategoriesItem(category: categories![index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
