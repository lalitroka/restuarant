import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserHelpSupportPage extends StatefulWidget {
  const UserHelpSupportPage({super.key});

  @override
  State<UserHelpSupportPage> createState() => _UserHelpSupportPageState();
}

class _UserHelpSupportPageState extends State<UserHelpSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
              child: CustomPaint(
      painter: BackgroundPainter(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.white,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Text('Report a problem ',
                    style: AppTextStyles.titlemedium
                        .copyWith(color: Colors.white70)),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.white,
                        offset: Offset(0, 3),
                      )
                    ],
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30)),
                child: Text('Support ',
                    style: AppTextStyles.titlemedium
                        .copyWith(color: Colors.white70)),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.white,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Text('Support Inbox ',
                    style: AppTextStyles.titlemedium
                        .copyWith(color: Colors.white70)),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.white,
                        offset: Offset(0, 3),
                      )
                    ],
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Term & Policies ',
                  style: AppTextStyles.titlemedium
                      .copyWith(color: Colors.white70),
                ),
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
