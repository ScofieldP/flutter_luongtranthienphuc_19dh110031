import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/order.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/purchase/components/shipping_detail.dart';

class ListTilePurchase extends StatefulWidget {
  final Order order;

  const ListTilePurchase({Key? key, required this.order}) : super(key: key);

  @override
  State<ListTilePurchase> createState() => _ListTilePurchaseState();
}

class _ListTilePurchaseState extends State<ListTilePurchase> {
  @override
  @override
  Widget build(BuildContext context) {
    List<Widget> productRows = [];

    for (int i = 0; i < widget.order.products.length; i++) {
      final product = widget.order.products[i];
      final title = product['title'] ?? "";
      final price = product['price'] ?? 0.0;

      productRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('\$$price'),
        ],
      ));
    }

    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.shopping_bag, color: Colors.green),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productRows,
        ),
        tileColor: Colors.white,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShippingDetail(order: widget.order),
            ),
          );
        },
      ),
    );
  }
}
