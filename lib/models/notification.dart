import 'dart:convert';

class NotificationModel{
  final String userId, id, title, body;

  NotificationModel({required this.userId,required this.id, required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'id': id,
      'userId': userId,

    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      id: map['_id'],
      userId: map['userId'] ?? "",

    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));
}