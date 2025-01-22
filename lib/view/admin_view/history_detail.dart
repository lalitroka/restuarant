import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key});

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Container(
            height: screenHeight,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'GO BACK',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 23),
                      )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '#32343 ',
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightGreenAccent),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Sonam Pandey',
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Contact NO.:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        '987343245',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Food Name:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        'Nepali Thali',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Flexible(
                        child: Text(
                          '1000000000000',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Address:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Flexible(
                        child: Text(
                          '1234 New Baneshwor Road, Apartment 5B, Kathmandu, Bagmati 44600, Nepal',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Payment With:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Flexible(
                        child: Text(
                          ' Esewa ',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Date:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Flexible(
                        child: Text(
                          '20-02-2025',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Time:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Flexible(
                        child: Text(
                          '10:00 AM',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Feedback by user:  ',
                        style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 3 ? Icons.star : Icons.star_border,
                          color: Colors.orangeAccent,
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ''' I had a great experience dining at your restaurant. The food was absolutely delicious, and the staff was very friendly. The ambiance was warm and inviting, which made it a pleasant dining experience.''',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
