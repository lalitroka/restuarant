import 'package:flutter/material.dart';

class AppColor {   
  static Color cardcolor = Color.fromARGB(255, 25, 29, 32);
  static Color backgroundColor = Color.fromRGBO(235,244,241,1);
  static Color bodyColor =   Color.fromRGBO(255, 255, 255, 2);
  static Color softblackColor =const Color.fromARGB(232, 10, 16, 20);

  static List<BoxShadow> cardboxShadow = [
    BoxShadow(
      color: Colors.blueGrey,
      spreadRadius: -1,
      offset: Offset(1, 3),
      blurRadius: 8.3,
    )
  ];
}
