import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class FoodNotificationTab extends StatefulWidget {
  const FoodNotificationTab({super.key});

  @override
  State<FoodNotificationTab> createState() => _FoodNotificationTabState();
}

class _FoodNotificationTabState extends State<FoodNotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
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
                                    'Query By table No. 3 ',
                                    style: AppTextStyles.titleSmall,
                                  ),
                                     RichText(
                                      
                                      text: TextSpan(
                                      
                                   
                                        children: [
                                            TextSpan(
                                            text: 'Food Name:',
                                            style: AppTextStyles.titleSmall
                                          ),
                                        WidgetSpan(child: SizedBox(width: 5,)),
                                        TextSpan(
                                            text: 'Pizza',
                                            style: AppTextStyles.titlemedium.copyWith(color: Colors.lightGreen)
                                          )
                                        ]

                                      ),
                                      
                                      
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