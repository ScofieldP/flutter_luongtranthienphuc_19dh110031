import 'dart:convert';

import 'dart:convert';

class Products {
  String id;
  String title;
  String description;
  String image;
  num price;
  int quantity; // Thêm thuộc tính quantity
  num totalPrice; // Thêm thuộc tính totalPrice

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.totalPrice, // Thêm thuộc tính totalPrice
  });

  Products copyWith({int? quantity}) { // Sử dụng copyWith để tạo ra một đối tượng mới với giá trị quantity mới
    return Products(
      id: id,
      title: title,
      description: description,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice, // Thêm thuộc tính totalPrice

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': description,
      'img': image,
      'price': price,
      '_id': id,
      'quantity': quantity, // Thêm thuộc tính quantity vào Map
      'totalPrice': quantity * price,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      title: map['title'] ?? '',
      description: map['desc'] ?? '',
      image: map['img'] ?? '',
      price: map['price'] ?? 0.0,
      id: map['_id'] ?? '',
      quantity: map['quantity'] ?? 1, // Thêm thuộc tính quantity vào factory method
      totalPrice: map['totalPrice'] ?? 0, // Thêm giá trị của totalPrice

    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) => Products.fromMap(json.decode(source));
}
