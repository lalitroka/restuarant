import 'package:flutter/material.dart';
import 'package:foodmenu/core/services/esewa/esewa_action.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:foodmenu/view/userview/payment_success.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({super.key});

  @override
  State<UserPayment> createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text('Select Plan',
                              style: AppTextStyles.displaymedium),
                        ),
                      ),
                    ],
                  ),
                  Image(
                      height: 300,
                      width: 300,
                      image: AssetImage('assets/logo.png')),
                  Expanded(
                    child: Column(
                      spacing: 15,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(31, 227, 217, 217),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text('Cash Payment',
                                style: AppTextStyles.displaymedium),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text('OR', style: AppTextStyles.displaysmall),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'qrpaymentPage');
                          },
                          child: Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(31, 227, 217, 217),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text('QR Payment',
                                  style: AppTextStyles.displaymedium),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              EsewaAction esewaAction = EsewaAction();
                              double amounts = await esewaAction.pay();

                              if (amounts > 0) {
                                Navigator.push(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentSuccessPage(amount: amounts),
                                  ),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Payment failed. Please try again.")),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text('Pay via Esewa',
                                  style: AppTextStyles.buttonText),
                            )),
                      ],
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
