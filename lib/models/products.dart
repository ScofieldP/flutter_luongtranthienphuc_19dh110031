import 'dart:convert';

class Products {
  String id;
  String title;
  String description;
  String image;
  num price;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price});


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': description,
      'img': image,
      'price': price,
      '_id': id,
    };
  }

    factory Products.fromMap(Map<String, dynamic> map) {
      return Products(
        title: map['title'] ?? '',
        description: map['desc'] ?? '',
        image: map['img'] ?? '',
        price: map['price'] ?? 0.0,
        id: map['_id'] ?? '',
      );
    }

    String toJson() => json.encode(toMap());

    factory Products.fromJson(String source) =>
        Products.fromMap(json.decode(source));
}
