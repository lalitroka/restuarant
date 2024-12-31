import 'dart:io'; // To check platform
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/view/admin_view/category_add.dart';
import 'package:foodmenu/view/admin_view/food_description.dart';
import 'package:foodmenu/view/admin_view/food_view.dart';
import 'package:foodmenu/view/admin_view/fooditems_add.dart';
import 'package:foodmenu/view/admin_view/homepage.dart';
import 'package:foodmenu/view/userview/foodmenu.dart';
import 'package:foodmenu/view/userview/order_detial.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FoodOrderBloc()),
        BlocProvider(create: (_) => FoodCategoryBloc()),
        BlocProvider(create: (_) => FoodItemBloc()),
        BlocProvider(create: (_) => FoodSizeAddBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homepage',
        routes: {
          // user page

          '/': (context) => FoodMenuPage(),
          '/orderpage': (context) => OrderDetailPage(),

          //admin

          '/homepage': (context) => HomePage(),
          '/categoryaddpage': (context) => CategoryAddPage(),
          '/fooditemsaddpage': (context) => FoodItemsAddPage(),
          '/fooddescription': (context) => FoodDescriptionPage(),
          '/foodviewpage': (context) => FoodView(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/orderpage':
              return _navigateRouter(OrderDetailPage());
            default:
              return _navigateRouter(FoodMenuPage());
          }
        },
      ),
    );
  }

  PageRoute _navigateRouter(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => page,
      );
    } else if (Platform.isAndroid) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut));
        var opacityAnimation = animation.drive(tween);
        return FadeTransition(opacity: opacityAnimation, child: child);
      },
    );
  }
}
