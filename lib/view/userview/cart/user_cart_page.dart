import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:foodmenu/view/userview/cart/user_order_processing.dart';
import 'package:foodmenu/view/userview/cart/user_order_submit.dart';

class UserCartPage extends StatefulWidget {
  const UserCartPage({super.key});

  @override
  State<UserCartPage> createState() => _UserCartPageState();
}

class _UserCartPageState extends State<UserCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child:DefaultTabController(
              length: 2,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                      Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TabBar(
                         dividerColor: Colors.transparent,
                        tabs: [
                          Text(' Submit Order ',style: AppTextStyles.titlemedium,),
                             Text(' Processing ',style: AppTextStyles.titlemedium,)
                        ],
                       ),
                     ),
        
                    Expanded(
                      child: TabBarView(
                        
                        children: [
                        UserOrderSubmitTab(),
                        UserOrderProcessingTab()
                      ]),
                    ),
                 
                   
                   ],
                 ),
               ))
          ),
        ),
      ),
    );
  }
}