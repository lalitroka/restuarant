import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserPersonalDetailPage extends StatefulWidget {
  const UserPersonalDetailPage({super.key});

  @override
  State<UserPersonalDetailPage> createState() => _UserPersonalDetailPageState();
}

class _UserPersonalDetailPageState extends State<UserPersonalDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: 10,
                  ),
                  Text('Personal Detial', style: AppTextStyles.displaymedium),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'You decide what personal details you make visible to others',
                      style: AppTextStyles.titlelarge),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text("Name ",
                                style: AppTextStyles.titlemedium
                                    .copyWith(color: Colors.white70)),
                            subtitle: Text("Bablu Pandey ",
                                style: AppTextStyles.titlemedium),
                            trailing: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 141, 236, 145),
                              size: 24,
                            ),
                          ),
                          ListTile(
                            title: Text('Email',
                                style: AppTextStyles.titlemedium
                                    .copyWith(color: Colors.white70)),
                            subtitle: Text('BabluPandey@gmail.com',
                                style: AppTextStyles.titlemedium),
                            trailing: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 141, 236, 145),
                              size: 24,
                            ),
                          ),
                          ListTile(
                            title: Text('Address',
                                style: AppTextStyles.titlemedium
                                    .copyWith(color: Colors.white70)),
                            subtitle: Text('Kathmandu',
                                style: AppTextStyles.titlemedium),
                            trailing: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 141, 236, 145),
                              size: 24,
                            ),
                          ),
                          ListTile(
                            title: Text('Phone Number',
                                style: AppTextStyles.titlemedium
                                    .copyWith(color: Colors.white70)),
                            subtitle: Text('98435353454',
                                style: AppTextStyles.titlemedium),
                            trailing: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 141, 236, 145),
                              size: 24,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/useraccountdelete');
                            },
                            child: ListTile(
                              title: Text('Take onwership and control',
                                  style: AppTextStyles.titlemedium
                                      .copyWith(color: Colors.white70)),
                              subtitle: Text(
                                  'Manage your data,deactivate, delete or reactivate your account and profiles',
                                  style: AppTextStyles.titlemedium),
                              trailing: Transform.flip(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 141, 236, 145),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
