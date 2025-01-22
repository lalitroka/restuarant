import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget for  FoodCategoryContainer
class FoodCategoryTextContainer extends StatelessWidget {
  final String foodCategoryName;
  const FoodCategoryTextContainer({super.key, required this.foodCategoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.yellow),
      child: Text(foodCategoryName,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700)),
    );
  }
}

// Widget for FoodName
class FoodNameText extends StatelessWidget {
  final String foodName;
  const FoodNameText({super.key, required this.foodName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 153,
      child: Text(
        foodName,
        style: GoogleFonts.rubik(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// Widget for FoodPrice
class FoodPriceText extends StatelessWidget {
  final double foodPrice;
  const FoodPriceText({super.key, required this.foodPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 77,
      child: Text(
        '\$${foodPrice.toStringAsFixed(2)}',
        style: GoogleFonts.rubik(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

// Widget  to make  TextFiled Container for request for the food like quantity and number of people

class TextFieldContainer extends StatelessWidget {
  final TextEditingController controllerType;
  final String labelText;
  const TextFieldContainer(
      {super.key, required this.labelText, required this.controllerType});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 130,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controllerType,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white, fontSize: 20),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              border: OutlineInputBorder(),
              labelText: labelText,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                  color: Colors.white)),
        ));
  }
}
