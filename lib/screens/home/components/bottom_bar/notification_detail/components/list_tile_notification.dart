import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/notification.dart';

class ListTileNotification extends StatelessWidget {
  final NotificationModel notificationModel;

  const ListTileNotification({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Icon(Icons.notifications, color: Colors.yellow),
        ),
        title: Text(notificationModel.title),
        subtitle: Text(notificationModel.body),
        tileColor: Colors.white,
      ),
    );
  }
}
