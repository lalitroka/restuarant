// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class OrderProcessingTab extends StatefulWidget {
  const OrderProcessingTab({super.key});

  @override
  State<OrderProcessingTab> createState() => _OrderProcessingTabState();
}

class _OrderProcessingTabState extends State<OrderProcessingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/paymentviewpage');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Order: #201',
                              style: AppTextStyles.titleSmall
                                  .copyWith(color: Colors.greenAccent)),
                          Text('mike tyson', style: AppTextStyles.titleSmall),
                          Text('983232232', style: AppTextStyles.bodymedium),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Buff MOMO', style: AppTextStyles.titlemedium),
                          Text('1000', style: AppTextStyles.titlemedium),
                        ],
                      ),
                      Column(
                        children: [
                          Text(' 2:20 PM', style: AppTextStyles.titlemedium),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
