import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const String fontFamily = "poppins";

  static TextStyle displayLarge = GoogleFonts.kanit(
    fontSize: 42,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaymedium = GoogleFonts.kanit(
    fontSize: 34,
    color: Colors.white,
  );

  static TextStyle displaysmall = GoogleFonts.kanit(
    fontSize: 27,
    color: Colors.white,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle titlelarge = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 23,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titlemedium = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle titleSmall = GoogleFonts.poppins(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle bodymedium = GoogleFonts.poppins(
      color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700);

  static const TextStyle searchFilter = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
