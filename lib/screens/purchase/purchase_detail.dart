import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/purchase/components/list_tile_purchase.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/purchase/services/purchase_services.dart';

import '../../models/order.dart';

class PurchaseDetail extends StatefulWidget {
  const PurchaseDetail({Key? key}) : super(key: key);

  @override
  State<PurchaseDetail> createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail> {
  List<Order> orders = [];
  final PurchaseServices purchaseServices = PurchaseServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await purchaseServices.userOrder(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        itemCount: orders.length, // add itemCount parameter
        itemBuilder: (context, index) {
    return ListTilePurchase(order: orders[index]);
    }));
  }
}
