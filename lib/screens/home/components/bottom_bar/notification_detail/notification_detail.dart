import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/notification.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/notification_detail/components/list_tile_notification.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/notification_detail/services/get_notification_service.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({Key? key}) : super(key: key);

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  List<NotificationModel> notifications = [];
  final GetNotificationService getNotificationService =
      GetNotificationService();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    notifications =
        await getNotificationService.fetchUserNotification(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return notifications != null // check if notifications is not null
        ? Expanded(
          child: ListView.builder(
              itemCount: notifications.length, // add itemCount parameter
              itemBuilder: (context, index) {
                return ListTileNotification(
                  notificationModel: notifications[index],
                );
              }),
        )
        : const Center(
            child:
                CircularProgressIndicator(), // show progress indicator while notifications is null
          );
  }
  }
