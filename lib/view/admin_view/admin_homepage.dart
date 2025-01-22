import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/view/admin_view/admin_history.dart';
import 'package:foodmenu/view/admin_view/homepage.dart';
import 'package:foodmenu/view/admin_view/order.dart';
import 'package:foodmenu/view/admin_view/foodreceive/order_receive.dart';
import 'package:foodmenu/view/userview/foodmenu.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  int selectedIndex = 1;
  List<Widget> pages = [
    HomePage(),
    OrderReceivePage(),
    AdminHistoryPage(),
    FoodMenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black87,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home, Icons.home_outlined),
              _buildNavItem(1, Icons.card_giftcard, Icons.car_crash_outlined),
              _buildNavItem(2, Icons.notifications, Icons.notifications_none),
              _buildNavItem(3, Icons.settings, Icons.settings_outlined),
            ],
          ),
        ));
  }

  Widget _buildNavItem(int index, IconData filledIcon, IconData outlinedIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Icon(
        selectedIndex == index ? filledIcon : outlinedIcon,
        color: Colors.white,
        size: selectedIndex == index ? 33 : 30,
      ),
    );
  }
}
