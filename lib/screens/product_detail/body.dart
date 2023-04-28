import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/products.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/components/add_product_to_cart.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/product_detail/components/add_product_to_favorite.dart';

class Body extends StatefulWidget {
  final Products products;

  const Body({super.key, required this.products});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) { // giới hạn giá trị tối thiểu là 1
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(_quantity);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network(widget.products.image),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Text("Description: ${widget.products.description}"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantitySelector(
                quantity: _quantity,
                onIncrement: _incrementQuantity,
                onDecrement: _decrementQuantity,
              ),
              Text(widget.products.price.toStringAsFixed(2)),
              // PriceDisplay(
              //   price: widget.products.price * _quantity,
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AddProductToCart(products: widget.products, quantity: _quantity),
          const SizedBox(
            height: 20,
          ),
          AddProductToFavorite(products: widget.products),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: onDecrement,
        ),
        Text('$quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}

class PriceDisplay extends StatelessWidget {
  final double price;

  const PriceDisplay({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final formattedPrice = '\$${price.toStringAsFixed(2)}';

    return Text(
      formattedPrice,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
