import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminSettingPage extends StatefulWidget {
  const AdminSettingPage({super.key});

  @override
  State<AdminSettingPage> createState() => _AdminSettingPageState();
}

class _AdminSettingPageState extends State<AdminSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    
                    },
       child: Icon(Icons.arrow_back,color: Colors.white, size: 30,),
                  ),
                  Center(child: Text("Settings & privacy",style: AppTextStyles.displaymedium,)),
                  SizedBox(height: 20,),
                  Text(
                    'Account Details',
                    style: AppTextStyles.titlemedium,
                  ),
                   Text(
                    'password and security',
                    style: AppTextStyles.titlemedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
