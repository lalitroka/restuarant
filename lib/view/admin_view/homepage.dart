import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClick = false;
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: Column(
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          splashColor: Colors.blueGrey,
          onPressed: () {
            if (isClick == true) {
              _showpopUp(context);
            } else {
              _hidepopUp();
            }
            setState(() {
              isClick = !isClick;
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
                    Navigator.pushNamed(context, '/categoryaddpage');
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
                    Navigator.pushNamed(context, '/fooditemsaddpage');
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
