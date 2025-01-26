import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/admin_view/adminauth/admin_login.dart';
import 'package:foodmenu/view/admin_view/adminauth/admin_register.dart';

class AdminLoginHomePage extends StatefulWidget {
  final int initalTabIndex;
  const AdminLoginHomePage({super.key, this.initalTabIndex = 0});

  @override
  State<AdminLoginHomePage> createState() => _AdminLoginHomePageState();
}

class _AdminLoginHomePageState extends State<AdminLoginHomePage>{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea( 
        child: DefaultTabController(
          length: 2,
          initialIndex: widget.initalTabIndex,
          child: Column(
            spacing: 10,
            children: [
        
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text(
                    'Get Started now',
                  style:
                      AppTextStyles.displayLarge.copyWith(color: Colors.black),
                ),
              ),
              Text(
                'Create an account or log in to app ',
                style: AppTextStyles.titleSmall.copyWith(color: Colors.black),
              ),
        
              Container(
                height: 45,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: const Color.fromARGB(255, 229, 227, 227)),
                child: TabBar(
                    overlayColor: WidgetStatePropertyAll(Colors.amber),
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tabs: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Sign In ',
                            style: AppTextStyles.titlemedium
                                .copyWith(color: Colors.black),
                          )),
                      Text(
                        'log In',
                        style: AppTextStyles.titlemedium
                            .copyWith(color: Colors.black),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  AdminRegisterPage(),
                  AdminLoginPage(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}




