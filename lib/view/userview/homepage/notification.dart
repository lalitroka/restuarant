import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

   List<Map<dynamic, dynamic>> notification =[
  {'name': "Kathmandu Restaurant", 'waitingtime': "23", 'time': '3'},
  {'name': "Everest Dine", 'waitingtime': "15", 'time': '2'},
  {'name': "Himalayan Flavors", 'waitingtime': "30", 'time': '4'},
  {'name': "Spicy Nepal", 'waitingtime': "20", 'time': '3'},
  {'name': "Taste of Nepal", 'waitingtime': "25", 'time': '3'},
  {'name': "Momo Heaven", 'waitingtime': "18", 'time': '2'},
  {'name': "Newari Delights", 'waitingtime': "22", 'time': '3'},
  {'name': "Gorkha Kitchen", 'waitingtime': "28", 'time': '4'},
  {'name': "Nepali Bites", 'waitingtime': "17", 'time': '2'},
  {'name': "Himalayan Taste", 'waitingtime': "35", 'time': '5'}
];

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
                Text('Notification', style: AppTextStyles.headlineLarge),
                const SizedBox(height: 10), 
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: notification.length,
                    itemBuilder: (context, index) {
                        final waitngtime = notification[index].values.elementAt(1);
                     final time = notification[index].values.elementAt(2);
         

                      return Container(
                        padding: const EdgeInsets.all(10), 
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 25, 29, 32),
                          borderRadius: BorderRadius.circular(12), 
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/resturant.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            
                      
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Text('Your Food is processing',style: AppTextStyles.titleSmall,),
                                  Text(
                                    'Wait for $waitngtime  minutes',
                                    style: AppTextStyles.titleSmall.copyWith(color: Colors.green),
                                  ),
                                  Text(
                                    '${time}h ago',
                                    style: AppTextStyles.titleSmall,
                                  ),
                                ],
                              ),
                            ),

                       
                            Icon(Icons.timer, color: Colors.white),
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
