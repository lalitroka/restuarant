import 'package:flutter/material.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentListView extends StatefulWidget {
  const PaymentListView({super.key});

  @override
  State<PaymentListView> createState() => _PaymentListViewState();
}

class _PaymentListViewState extends State<PaymentListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
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
                      SizedBox(width: 25),
                      Text(
                        'Payment List',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white10),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Type',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Total',
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Product Quantity',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '2',
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '2000',
                                    style: GoogleFonts.poppins(
                                      color: Colors.greenAccent,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white12,
                                endIndent: 80,
                                indent: 80,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cash',
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 4),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Time',
                                    style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: TextField(
                                      controller: _controller,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: InputDecoration(
                                        hintText: 'Enter Time',
                                        hintStyle:
                                            TextStyle(color: Colors.white70),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide:
                                              BorderSide(color: Colors.white),
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
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )),
                              )
                            ],
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
      ),
    );
  }
}
