import 'package:flutter/material.dart';
import 'package:foodmenu/core/routes/app_routes.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/admin_view/adminauth/home_login.dart';

class  AdminRegisterSuccessPage extends StatefulWidget {
  const  AdminRegisterSuccessPage({super.key});

  @override
  State< AdminRegisterSuccessPage> createState() => _AdminRegisterSuccessPageState();
}

class _AdminRegisterSuccessPageState extends State< AdminRegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close , size:  40,weight: 2,)),
                Container(
                  height:screenHeight * 0.5,
                ),
                 Text("Thank You!",style: AppTextStyles.displayLarge.copyWith(color: Colors.black),),
                 Text("Your account is  successfully Created",style: AppTextStyles.titlemedium.copyWith(color: Colors.black),),
                  Spacer(),
                    Align(
                alignment: Alignment.center,
                 child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100 ,vertical: 10),
                    backgroundColor: Colors.blue
                  ),
                  onPressed: (){
                      Navigator.push(context,  customPageRoute(AdminLoginHomePage(initalTabIndex: 1,)) );
                 }, child: Text('Continue', style: AppTextStyles.titlemedium,)),
               ),
        
               SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}