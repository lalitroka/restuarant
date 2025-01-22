import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPayment extends StatefulWidget {
  const OrderPayment({super.key});

  @override
  State<OrderPayment> createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              Text("Recent activity", style: AppTextStyles.titlemedium),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          'You donot have any pending or complete activity. when you shop or transfer money , that activity will appear here',
                          style: AppTextStyles.titlemedium
                              .copyWith(color: Colors.white70)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
