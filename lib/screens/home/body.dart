import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/providers/notification/services/notification_service.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/account_detail/account_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/farvorite_detail/farvorite_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/home_detail/home_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/bottom_bar/notification_detail/notification_detail.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/header/home_header.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/home/components/header/menu_header.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/purchase/purchase_detail.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    NotificationService.notificationService(context);
  }

  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      const HomeDetail(),
      const FavoriteDetail(),
      const NotificationDetail(),
      const PurchaseDetail(),
      const AccountDetail()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: flag ? const HomeHeader() : const MenuHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
            selectIndex != 4 ? flag = true : flag = false;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Purchase",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [screen[selectIndex]],
        ),
      ),
    );
  }
}
