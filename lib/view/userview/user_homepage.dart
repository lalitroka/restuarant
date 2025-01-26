// import 'package:flutter/material.dart';
// import 'package:foodmenu/view/userview/cart/user_order_submit.dart';
// import 'package:foodmenu/view/userview/homepage/order_payment_history.dart';
// import 'package:foodmenu/view/userview/homepage/user_food_page.dart';
// import 'package:foodmenu/view/userview/profile/user_profile_page.dart';
// import 'package:foodmenu/view/userview/homepage/user_food_favorite.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the package

// class UserHomePage extends StatefulWidget {
//   final int selectedIndex;
//   const UserHomePage({super.key, this.selectedIndex = 0});

//   @override
//   State<UserHomePage> createState() => _UserHomePageState();
// }

// class _UserHomePageState extends State<UserHomePage> {
//   late int _selectIndex;
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _selectIndex = widget.selectedIndex;
//     _pageController = PageController(initialPage: _selectIndex);
//   }

//   final List<Widget> _pages = [
//     UserFoodPage(),
//     UserFoodFavoritePage(),
//     UserOrderSubmitTab(),
//     UserOrderPaymentHistoryPage(),
//     UserProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: BouncingScrollPhysics(),
//         onPageChanged: (index) {
//           setState(() {
//             _selectIndex = index;
//           });
//         },
//         children: _pages,
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _selectIndex,
//         height: 60,
//         color: Color.fromARGB(70, 172, 172, 172),
//         buttonBackgroundColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
     
//         letIndexChange: (index) {
//           setState(() {
//             _selectIndex = index;
//           });
//            _pageController.jumpToPage(index);  
//     return false;  
//         },
//         items: <Widget>[
//           _buildNavItem(0, Icons.home_outlined, Icons.home),
//           _buildNavItem(1, Icons.favorite_outline, Icons.favorite ),
//           _buildNavItem(2, Icons.shopping_cart_outlined, Icons.shopping_cart ),
//           _buildNavItem(3, Icons.padding, Icons.padding_rounded),
//           _buildNavItem(4, Icons.person_outline, Icons.person),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(int index, IconData icon, filledIcon) {
//     bool isSelected = _selectIndex == index;
//     return isSelected
//         ? Container(
//           padding: EdgeInsets.all(6),
//           decoration: BoxDecoration(
//                         color: Colors.green,
//            shape: BoxShape.circle
//           ),

//             child: Icon(
//               filledIcon,
//               size: 30,
//               color: Colors.white,
//             ),
//         )
         
//         : Icon(
//             icon,
//             size: 30,
//             color: Colors.blueGrey.shade800,
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodmenu/view/userview/cart/user_cart_page.dart';
import 'package:foodmenu/view/userview/homepage/notification.dart';
import 'package:foodmenu/view/userview/homepage/user_food_page.dart';


class UserHomePage extends StatefulWidget {
  final int? selectedIndex;
  const UserHomePage({super.key, this.selectedIndex = 0});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
   late int _selectIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectIndex = widget.selectedIndex!;
    _pageController = PageController(initialPage: _selectIndex);
  }

  final List<Widget> _pages = [
    UserFoodPage(),
    UserCartPage(),
    NotificationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
    
        height: 45,
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, Icons.home_outlined),
                        _buildNavItem(1, Icons.shopping_bag, Icons.shopping_bag_outlined),

            _buildNavItem(2, Icons.notifications, Icons.notifications_none),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData filledIcon, IconData outlinedIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
          
        });
          _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Icon(
        _selectIndex == index ? filledIcon : outlinedIcon,
        color: Colors.white,
        size: _selectIndex == index ? 33 : 30,
      ),
    );
  }
}



