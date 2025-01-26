
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class OrderProcessTab extends StatefulWidget {
  const OrderProcessTab({super.key});

  @override
  State<OrderProcessTab> createState() => _OrderProcessTabState();
}

class _OrderProcessTabState extends State<OrderProcessTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
              child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/adminorderprocessing');
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 29, 32),
                        borderRadius: BorderRadius.circular(12), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          spreadRadius: -1 ,
                          offset: Offset.fromDirection(1,3),
                          blurRadius: 8.3,
                        )
                      ]
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Order: #201',
                              style: AppTextStyles.titleSmall
                                  .copyWith(color: Colors.greenAccent)),
                                Text('Table No.  2', style: AppTextStyles.bodymedium.copyWith(fontWeight: FontWeight.w100)),
                          Text('mike tyson', style: AppTextStyles.titleSmall),
                       
                        ],
                      ),
                      Column(
                        children: [
                          Text('Quantiy', style: AppTextStyles.titlemedium),
                          Text('3', style: AppTextStyles.titlemedium),
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
          )),
        ),
      ),
    );
  }
}
