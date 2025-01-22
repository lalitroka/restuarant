import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
import 'package:foodmenu/view/admin_view/admin_history.dart';
import 'package:foodmenu/view/admin_view/admin_homepage.dart';
import 'package:foodmenu/view/admin_view/category_add.dart';
import 'package:foodmenu/view/admin_view/food_add_page.dart';
import 'package:foodmenu/view/admin_view/food_analysis.dart';
import 'package:foodmenu/view/admin_view/food_revenue.dart';
import 'package:foodmenu/view/admin_view/fooditems_add.dart';
import 'package:foodmenu/view/admin_view/foodview/food_description_view.dart';
import 'package:foodmenu/view/admin_view/foodview/food_view.dart';
import 'package:foodmenu/view/admin_view/history_detail.dart';
import 'package:foodmenu/view/admin_view/order.dart';
import 'package:foodmenu/view/admin_view/payment_list_view.dart';
import 'package:foodmenu/view/default_page.dart';
import 'package:foodmenu/view/userview/foodmenu.dart';
import 'package:foodmenu/view/userview/order_detial.dart';
import 'package:foodmenu/view/userview/payment_history.dart';
import 'package:foodmenu/view/userview/profile/account_delete.dart';
import 'package:foodmenu/view/userview/profile/help_support.dart';
import 'package:foodmenu/view/userview/profile/history.dart';
import 'package:foodmenu/view/userview/profile/invite_friend.dart';
import 'package:foodmenu/view/userview/profile/order_payment.dart';
import 'package:foodmenu/view/userview/profile/personal_detail.dart';
import 'package:foodmenu/view/userview/profile/profile_page.dart';
import 'package:foodmenu/view/userview/qr_payment.dart';
import 'package:foodmenu/view/userview/user_homepage.dart';
import 'package:foodmenu/view/userview/user_payment.dart';

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
        BlocProvider(create: (_) => FoodSizeAddBloc()),
        BlocProvider(create: (_) => DescriptionBloc()),
        BlocProvider(create: (_) => ImageaddBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/foodmenupage',
        routes: {
          //
          '/defaultpage': (context) => DefaultPage(),
          //
          // user page
          '/userhomepage': (context) => UserHomePage(),
          '/foodmenupage': (context) => FoodMenuPage(),
          '/orderpage': (context) => OrderDetailPage(),
          '/userpaymentpage': (context) => UserPayment(),
          '/qrpaymentpage': (context) => QrPayment(),
          '/paymenthistorypage': (context) => PaymentHistoryPage(),
          // profile
          '/profilepage': (context) => ProfilePage(),
          '/personaldetailpage': (context) => PersonalDetail(),
          '/orderpaymentpage': (context) => OrderPayment(),
          '/invitepage': (context) => InviteFriend(),
          '/historypage': (context) => History(),
          '/helpsupportpage': (context) => HelpSupport(),
          '/accountdelete': (context) => AccountDelete(),

          // commom
          //
          //
          '/fooddescriptionview': (context) => FoodDescriptionView(),

          //
          //
          //admin
          '/adminhomepage': (context) => AdminHomepage(),
          // '/homepage': (context) => OrderListPage(),
          '/categoryaddpage': (context) => CategoryAddPage(),
          '/fooditemsaddpage': (context) => FoodItemsAddPage(),
          '/foodviewpage': (context) => FoodView(),
          '/paymentviewpage': (context) => PaymentListView(),
          '/adminhistory': (context) => AdminHistoryPage(),
          '/adminhisotorydetail': (context) => HistoryDetailPage(),
          '/foodanalysis': (context) => FoodAnalysisPage(),
          '/foodrevenue': (context) => FoodRevenuePage(),
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
