import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_text_style.dart';

class AdminNewFoodDetailPage extends StatefulWidget {
  const AdminNewFoodDetailPage({super.key});

  @override
  State<AdminNewFoodDetailPage> createState() => _AdminNewFoodDetailPageState();
}

class _AdminNewFoodDetailPageState extends State<AdminNewFoodDetailPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
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
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 65),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'New Order',
                        style: AppTextStyles.displaymedium.copyWith(fontWeight: FontWeight.w700)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.62,
                  child:     ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              
                              margin: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 25, 29, 32),
                                  boxShadow: [
                                    BoxShadow(
                                      
                                      color: const Color.fromARGB(255, 248, 231, 231),
                                      offset: Offset(0, 1),
                                      blurRadius: 1,
                                      spreadRadius: -1,
                                      blurStyle: BlurStyle.solid
                                    )
                                  ]
                              ),
                              child: Column(
                                spacing: 5,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Food',
                                        style: AppTextStyles.titlemedium
                                      ),
                                      Text(
                                        'panipuri',
                                        style: AppTextStyles.titlemedium.copyWith(  color: Colors.grey, fontSize: 22)
                                      ),
                                    ],
                                  ),
                             
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantity',
                                           style: AppTextStyles.titlemedium
                                      ),
                                      Text(
                                        '2',
                                               style: AppTextStyles.titlemedium.copyWith(color: Colors.grey, fontSize: 22)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price',
                                             style: AppTextStyles.titlemedium
                                      ),
                                      Text(
                                        '2000',
                                              style: AppTextStyles.titlemedium.copyWith( color: Colors.greenAccent, fontSize: 22)
                                      ),
                                    ],
                                  ),
                                    
                                ],
                              ),
                            );
                          },
                        ),
                ),
                Divider(
                  color: Colors.white12,
                  endIndent: 80,
                  indent: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Text(
                        'Unpaid',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time',
                      style: AppTextStyles.titlelarge
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: _controller,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Enter Time',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sent processing Time,',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
