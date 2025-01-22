import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodRevenuePage extends StatefulWidget {
  const FoodRevenuePage({super.key});

  @override
  State<FoodRevenuePage> createState() => _FoodRevenuePageState();
}

class _FoodRevenuePageState extends State<FoodRevenuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              Text(
                'Food Revenue',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Chicken Biryani',
                style: GoogleFonts.poppins(
                    color: Colors.lightGreenAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total revenue',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs.23000',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'part of Revenue ',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' 2%',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
