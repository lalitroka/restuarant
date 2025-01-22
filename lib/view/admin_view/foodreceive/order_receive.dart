import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/admin_view/foodreceive/new_order.dart';
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
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const Expanded(
                  child: TabBarView(
                    children: [
                      NewOrderTap(),
                      NewOrderTap(),
                      NewOrderTap(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TabBar(
                    tabs: [
                      Text('New Order', style: AppTextStyles.titleSmall),
                      Text('Processing', style: AppTextStyles.titleSmall),
                      Text('Complete', style: AppTextStyles.titleSmall),
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
