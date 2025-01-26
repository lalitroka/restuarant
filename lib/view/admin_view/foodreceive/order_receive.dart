import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/admin_view/foodreceive/new_order.dart';
import 'package:foodmenu/view/admin_view/foodreceive/order_complete.dart';
import 'package:foodmenu/view/admin_view/foodreceive/order_process.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';


class OrderReceivePage extends StatefulWidget {
  const OrderReceivePage({super.key});

  @override
  State<OrderReceivePage> createState() => _OrderReceivePageState();
}

class _OrderReceivePageState extends State<OrderReceivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    tabs: [
                      Text('New Order', style: AppTextStyles.titleSmall),
                      Text('Processing', style: AppTextStyles.titleSmall),
                      Text('Complete', style: AppTextStyles.titleSmall),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      NewOrderTab(),
                      OrderProcessTab(),
                      OrderCompleteTab()
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
