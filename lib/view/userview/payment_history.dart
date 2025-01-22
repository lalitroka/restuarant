import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  spacing: 40,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                    Text(
                      "Payment History",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (coneext, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Mattka Tea ',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      ' 3 months ago ',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '50000',
                                    style: GoogleFonts.poppins(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
