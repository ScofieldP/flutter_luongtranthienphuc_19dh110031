import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/components/product_popular/services/product_service.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/product_detali_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';
  final Products product;  // make sure this parameter is defined in the constructor

  const SearchScreen({Key? key, required this.product}) : super(key: key);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Products> allProducts = [];
  List<Products> searchResults = [];
  final ProductService productService = ProductService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    allProducts = await productService.productPopular(context: context);
    setState(() {});
  }

  final TextEditingController _searchController = TextEditingController();

  void searchProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    final List<Products> matches = allProducts.where((product) {
      final name = product.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return name.contains(queryLower);
    }).toList();

    setState(() {
      searchResults = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                _searchController.clear();
                searchProducts('');
              },
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          onChanged: searchProducts,
        ),
      ),
      body: searchResults.isNotEmpty
          ? ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final product = searchResults[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text(product.price.toStringAsFixed(2)),
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,
                        arguments: ProductDetailsArguments(product: product));
                  },
                );
              },
            )
          : const Center(
              child: Text('Search results will be displayed here'),
            ),
    );
  }
}
