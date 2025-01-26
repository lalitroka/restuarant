import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Create account ', style: AppTextStyles.displaymedium.copyWith(color: Colors.black),),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminloginhomepage');
                },
                child: Text(" I am consumer",style: AppTextStyles.titlelarge.copyWith(color: Colors.black),)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminloginhomepage');
                },
                child: Text('I am Service provider',style: AppTextStyles.titlelarge.copyWith(color: Colors.black),)),

               

          ],
        ),
      ),
    );
  }
}
