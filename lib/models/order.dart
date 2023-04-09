import 'dart:convert';

class Order {
  final String userId;
  List<Map<String, dynamic>> products;

  // final num subtotal; //phí ship
  // final num total;
  Map<String, dynamic> shipping;

  Order({
    required this.userId,
    required this.products,
    // required this.subtotal,
    // required this.total,
    required this.shipping,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'products': products
            .map((x) => {
                  'productId': x['productId'] ?? "Chưa có id",
                  'title': x['title'] ?? "",
                  'price': x['price'] ?? 0.0,
                })
            .toList(),
        // 'subtotal': subtotal,
        // 'total': total,
        'shipping': shipping.isNotEmpty
            ? {
                'name': shipping['name'],
                'address': shipping['address'],
                'phone': shipping['phone'],
              }
            : null,
      };

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      userId: json['userId'],
      products: List<Map<String, dynamic>>.from(json['products']?.map((x) => {
            'productId': x['id'],
            'title': x['title'],
            'price': x['price'],
          })),
      // subtotal: json['subtotal'],
      // total: json['total'],
      shipping: json['shipping'] != null
          ? {
              'name': json['shipping']['name'],
              'address': json['shipping']['address'],
              'phone': json['shipping']['phone'],
            }
          : {},
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
