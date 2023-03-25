import 'dart:convert';

class Categories {
  final String id;
  final String title;
  final String image;

  Categories({required this.id, required this.title, required this.image});

//  vinmart, 7/11, minishop, highland, circleK
//   static List<Categories> init() {
//     List<Categories> data = [
//       Categories(
//           id: 1, title: "HighLand", image: "assets/images/ic_highland.png"),
//       Categories(
//           id: 2, title: "HighLand", image: "assets/images/ic_circlek.png"),
//       Categories(
//           id: 3, title: "HighLand", image: "assets/images/ic_ministop.png"),
//       Categories(
//           id: 4, title: "HighLand", image: "assets/images/ic_seveneleven.png"),
//       Categories(
//           id: 5, title: "HighLand", image: "assets/images/ic_vinmart.png")
//     ];
//     return data;
//   }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'images': image,
      'id': id,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      title: map['title'] ?? '',
      image: map['img'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source));
}
