import 'package:flutter/material.dart';
import 'package:foodmenu/view/userview/foodmenu.dart';
import 'package:foodmenu/view/userview/notification.dart';
import 'package:foodmenu/view/userview/profile/profile_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    FoodMenuPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 45,
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, Icons.home_outlined),
            _buildNavItem(1, Icons.notifications, Icons.notifications_none),
            _buildNavItem(2, Icons.settings, Icons.settings_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData filledIcon, IconData outlinedIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Icon(
        _selectedIndex == index ? filledIcon : outlinedIcon,
        color: Colors.white,
        size: _selectedIndex == index ? 33 : 30,
      ),
    );
  }
}
