import 'package:flutter/material.dart';
import 'package:foodmenu/view/admin_view/dashboard/food%20analysis/homepage.dart';
import 'package:foodmenu/view/admin_view/foodreceive/order_receive.dart';
import 'package:foodmenu/view/admin_view/notification/notification.dart';
import 'package:foodmenu/view/admin_view/profile/admin_profile_page.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> with SingleTickerProviderStateMixin {
  
 late   PageController _pageController;
   
  int selectedIndex = 1;

  List<Widget> pages = [
    HomePage(),
    OrderReceivePage(),
    AdminNotificationpage(),
    AdminProfilePage()
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
         controller: _pageController,
         physics: BouncingScrollPhysics(),
         children: pages,
        ),
        bottomNavigationBar: Container(
          color: Colors.black87,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home, Icons.home_outlined),
              _buildNavItem(1, Icons.shopping_bag, Icons.shopping_bag_outlined),
              _buildNavItem(2, Icons.notifications, Icons.notifications_none),
              _buildNavItem(3, Icons.person_4_sharp, Icons.person_4_outlined),
            ],
          ),
        ));
  }

  Widget _buildNavItem(int index, IconData filledIcon, IconData outlinedIcon) {
    return GestureDetector(
      onTap: () {
         
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
