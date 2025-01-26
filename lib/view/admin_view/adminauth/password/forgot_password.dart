import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class  AdminForgotPasswordPage extends StatefulWidget {
  const  AdminForgotPasswordPage({super.key});

  @override
  State< AdminForgotPasswordPage> createState() => _AdminForgotPasswordPageState();
}

class _AdminForgotPasswordPageState extends State< AdminForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    )),
              ),
              Center(
                child: Text(
                  'Forgot Password',
                  style: AppTextStyles.displaymedium.copyWith(color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  'Please sign in to your existing account',
                  style: AppTextStyles.titleSmall.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                   
                    ),
                  
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                    
                      controller: _emailController,
                      decoration: InputDecoration(
                        floatingLabelStyle: AppTextStyles.bodysmall
                            .copyWith(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(5)),
                                        labelText: 'Email',
                                        labelStyle:
                        AppTextStyles.titleSmall.copyWith(
              
                          color: Colors.black)
                      ),
                      validator: (value) => value!.isNotEmpty
                          ? "please enter your exsiting email!"
                          : null,
                      style: AppTextStyles.titleSmall.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, '/adminpasswordverification');
                },
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            const Color.fromARGB(255, 82, 224, 43)),
                    child: Center(
                        child: Text(
                      'SEND CODE',
                      style: AppTextStyles.titlemedium,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
