import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class PaymentNotificationTab extends StatefulWidget {
  const PaymentNotificationTab({super.key});

  @override
  State<PaymentNotificationTab> createState() => _PaymentNotificationTabState();
}

class _PaymentNotificationTabState extends State<PaymentNotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        padding: const EdgeInsets.all(10), 
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          
                             GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/profilepage');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                            const SizedBox(width: 10),
                          
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payment By table No. 3 ',
                                    style: AppTextStyles.titlemedium,
                                  ),
                                 
                                  Text(
                                    ' orderId: #3434',
                                    style: AppTextStyles.titleSmall.copyWith(color: Colors.green),
                                  ),
                                     Text(
                                    'Pay Ammount:  3545 ',
                                    style: AppTextStyles.titlemedium,
                                  ),
                                  Text(
                                    '2h ago',
                                    style: AppTextStyles.titleSmall,
                                  ),
                                ],
                              ),
                            ),

                       
                          
                          ],
                        ),
                      );
                    },
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