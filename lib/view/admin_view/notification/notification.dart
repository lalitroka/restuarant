
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/admin_view/notification/food_notification_tab.dart';
import 'package:foodmenu/view/admin_view/notification/payment_notification_tab.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminNotificationpage extends StatefulWidget {
  const AdminNotificationpage({super.key});

  @override
  State<AdminNotificationpage> createState() => _AdminNotificationpageState();
}

class _AdminNotificationpageState extends State<AdminNotificationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(length: 2,
       child:CustomPaint(
        painter: BackgroundPainter(),
         child: SafeArea(
           child: Column(
            children: [
              Text('Notification', style: AppTextStyles.titlemedium,),
              TabBar(
                dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 70), 
                tabs: [
                   Text('Food', style: AppTextStyles.titlemedium,),
                 Text('Payment', style: AppTextStyles.titlemedium,),
                         
              ]),
           
              Expanded(
                child: TabBarView(children: [
                    FoodNotificationTab(),
                  PaymentNotificationTab(),
                
                ]),
              )
            ],
           ),
         ),
       ))
    );
  }
}