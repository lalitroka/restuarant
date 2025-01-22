import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Notificaiton', style: AppTextStyles.headlineLarge),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/resturant.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            style: AppTextStyles.titlemedium,
                            children: [
                              TextSpan(
                                text: 'Kathmandu Restaurant\n',
                              ),
                              TextSpan(
                                  text: 'Wait for 20 minutes',
                                  style: AppTextStyles.titleSmall
                                      .copyWith(color: Colors.green)),
                            ],
                          ),
                        ),
                        subtitle:
                            Text('2h ago', style: AppTextStyles.titleSmall),
                        trailing: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
