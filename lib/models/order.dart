import 'dart:convert';

class Order {
  final String id;
  final String userId;
  List<Map<String, dynamic>> products;

  // final num subtotal; //phí ship
  final num total;
  Map<String, dynamic> shipping;

  Order({
    required this.id,
    required this.userId,
    required this.products,
    // required this.subtotal,
    required this.total,
    required this.shipping,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'products': products
            .map((x) => {
                  'productId': x['productId'] ?? "Chưa có id",
                  'title': x['title'] ?? "",
                  'price': x['price'] ?? 0.0,
                })
            .toList(),
        // 'subtotal': subtotal,
        'total': total,
        'shipping': shipping.isNotEmpty
            ? {
                'name': shipping['name'],
                'address': shipping['address'],
                'phone': shipping['phone'],
              }
            : null,
      };

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? "chưa có id",
      userId: map['userId'] ?? "",
      products: List<Map<String, dynamic>>.from(map['products']?.map((x) => {
            'productId': x['id'],
            'title': x['title'],
            'price': x['price'],
          })),
      // subtotal: map['subtotal'],
      total: map['total'],
      shipping: map['shipping'] != null
          ? {
              'name': map['shipping']['name'],
              'address': map['shipping']['address'],
              'phone': map['shipping']['phone'],
            }
          : {},
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
