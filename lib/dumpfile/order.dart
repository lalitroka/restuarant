import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminFoodAddPage extends StatefulWidget {
  const AdminFoodAddPage({super.key});

  @override
  State<AdminFoodAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<AdminFoodAddPage> {
  bool isClick = false;
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _hidepopUp();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Text(
                        'OrderList',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton.icon(
                          iconAlignment: IconAlignment.end,
                          icon: Icon(
                            (Icons.remove_red_eye_rounded),
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _hidepopUp();
                            Navigator.pushNamed(context, '/adminhistory');
                          },
                          label: Text(
                            "History",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20),
                          ))
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/paymentviewpage');
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Order: #201',
                                    style: GoogleFonts.poppins(
                                        color: Colors.greenAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'mike tyson',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '983232232',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Buff MOMO',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '1000',
                                    style: GoogleFonts.poppins(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    ' 2:20 PM',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'processing',
                                    style: GoogleFonts.poppins(
                                        color: Colors.greenAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            )),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          splashColor: Colors.blueGrey,
          onPressed: () {
            if (overlayEntry == null) {
              _showpopUp(context);
            } else {
              _hidepopUp();
            }
            setState(() {
              isClick = overlayEntry != null;
            });
          },
          child: Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
    );
  }

  void _showpopUp(BuildContext context) {
    final overlay = Overlay.of(context);
    if (overlayEntry != null) return;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: 120,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _hidepopUp();
                    Navigator.pushNamed(context, '/adminFoodCategoryPage');
                  },
                  child: Text(
                    "Add Category",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    _hidepopUp();
                    Navigator.pushNamed(context,'/adminfooditempage');
                  },
                  child: Text(
                    'Add Items',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    overlay.insert(overlayEntry!);
  }

  void _hidepopUp() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
