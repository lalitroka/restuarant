import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {

  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 42,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaymedium = GoogleFonts.poppins(
    fontSize: 34,
    color: Colors.white,
  );

  static TextStyle displaysmall = GoogleFonts.poppins(
    fontSize: 27,
    color: Colors.white,
  );

  static  TextStyle headlineLarge = GoogleFonts.poppins(
  
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
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle bodysmall = GoogleFonts.poppins(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500);

  static  TextStyle searchFilter = GoogleFonts.poppins(
  
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static  TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
