import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserOrderSubmitTab extends StatefulWidget {
  const UserOrderSubmitTab({super.key});

  @override
  State<UserOrderSubmitTab> createState() => _UserOrderSubmitTabState();
}

class _UserOrderSubmitTabState extends State<UserOrderSubmitTab> {
  TextEditingController tableController = TextEditingController();
  List<Map<dynamic, dynamic>> foodDetail = [
    {'foodname': 'pizza pizzapiz pizza', 'price': '6350', 'quantity': 15},
    {'foodname': 'pasta', 'price': '520', 'quantity': 1},
    {'foodname': 'sandwich', 'price': '300', 'quantity': 1},
    {'foodname': 'sushi', 'price': '890', 'quantity': 1},
    {'foodname': 'taco', 'price': '410', 'quantity': 1},
    {'foodname': 'noodles', 'price': '350', 'quantity': 1},
    {'foodname': 'steak', 'price': '1200', 'quantity': 1},
    {'foodname': 'salad', 'price': '280', 'quantity': 1},
    {'foodname': 'fries', 'price': '250', 'quantity': 1}
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: foodDetail.length,
                  itemBuilder: (context, index) {
                    final food = foodDetail[index].values.elementAt(0);
                    final price = foodDetail[index].values.elementAt(1);
                    final quantity = foodDetail[index].values.elementAt(2);
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: AppColor.cardcolor,
                          boxShadow: AppColor.cardboxShadow),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.37,
                            child: Row(children: [
                              Text(quantity.toString(),
                                  style: AppTextStyles.titleSmall),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(Icons.close, color: Colors.white, size: 14),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: Text(
                                  food,
                                  style: AppTextStyles.titleSmall
                                      .copyWith(fontSize: 15),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(width: 5),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromARGB(255, 30, 38, 42),
                                ),
                                child: Icon(Icons.remove,
                                    color: Colors.white, size: 25),
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromARGB(255, 30, 38, 42),
                                ),
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 25),
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: screenWidth * 0.2,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '\$$price',
                                softWrap: true,
                                style: AppTextStyles.titleSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enter Table No.',
                  style: AppTextStyles.bodymedium,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: tableController,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Enter table number',
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: AppTextStyles.titlemedium,
                ),
                Text(
                  'Rs.3444',
                  style: AppTextStyles.titlemedium,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/userpaymentpage'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightGreen),
                  child: Text('Submit', style: AppTextStyles.headlineLarge),
                )),

          
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:foodmenu/core/utils/app_color.dart';
// import 'package:foodmenu/core/utils/app_text_style.dart';

// class UserOrderSubmitTab extends StatefulWidget {
//   const UserOrderSubmitTab({super.key});

//   @override
//   State<UserOrderSubmitTab> createState() => _UserOrderSubmitTabState();
// }

// class _UserOrderSubmitTabState extends State<UserOrderSubmitTab> {
//   TextEditingController tableController = TextEditingController();

//   List<Map<dynamic, dynamic>> foodDetail = [
//     {
//       'foodname': 'pizza pizzapizz  zapizzapiz zapizza',
//       'price': '65767776580',
//       'quantity': 1886
//     },
//     {'foodname': 'Pasta', 'price': '520', 'quantity': 1},
//     {'foodname': 'Sandwich', 'price': '4663', 'quantity': 51},
//     {'foodname': 'sushi', 'price': '890', 'quantity': 1},
//     {'foodname': 'taco', 'price': '410', 'quantity': 1},
//     {'foodname': 'noodles', 'price': '350', 'quantity': 1},
//     {
//       'foodname': 'burger burgerbur ger burger burger ',
//       'price': '4666',
//       'quantity': 14
//     },
//     {'foodname': 'steak', 'price': '1200', 'quantity': 1},
//     {'foodname': 'salad', 'price': '280', 'quantity': 1},
//     {'foodname': 'fries', 'price': '250', 'quantity': 1}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColor.backgroundColor,
//             ),
//             margin: EdgeInsets.only(bottom: 20),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(7),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color: const Color.fromARGB(31, 65, 65, 65)),
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.arrow_back_ios_rounded,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "Cart",
//                       style: AppTextStyles.titlemedium.copyWith(
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(7),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color: const Color.fromARGB(31, 65, 65, 65)),
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.close,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: AppColor.bodyColor,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40)),
//               ),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: foodDetail.length,
//                 itemBuilder: (context, index) {
//                   final food = foodDetail[index]['foodname'];
//                   final price = foodDetail[index]['price'];
//                   final quantity = foodDetail[index]['quantity'];

//                   return Container(
//                     padding: EdgeInsets.all(8),
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: AppColor.backgroundColor,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 80,
//                           width: 80,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage('assets/food.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         SizedBox(
//                           width: screenWidth * 0.4,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 food[0].toUpperCase() + food.substring(1),
//                                 style: AppTextStyles.titleSmall
//                                     .copyWith(color: Colors.black),
//                               ),
//                               Text(
//                                 'Rs.$price',
//                                 style: AppTextStyles.titleSmall
//                                     .copyWith(color: Colors.blue),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         Column(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Icon(Icons.add, size: 15),
//                             ),
//                             Text(quantity.toString(),
//                                 style: AppTextStyles.titleSmall
//                                     .copyWith(color: Colors.black)),
//                             Container(
//                               padding: EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Icon(Icons.remove, size: 15),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               spacing: 8,
//               children: [
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       spacing: 3,
//                       children: [
//                         Icon(Icons.padding),
//                         Text('Promo',
//                             style: AppTextStyles.titleSmall
//                                 .copyWith(color: Colors.black38)),
//                       ],
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                       decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 132, 112, 112),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Text('Apply', style: AppTextStyles.titleSmall),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Subtotal',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black38)),
//                     Text('44434',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black38)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Discount',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black38)),
//                     Text('34%',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black38)),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Shipping',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black38)),
//                     Text('-35',
//                         style: AppTextStyles.titlemedium
//                             .copyWith(color: Colors.black38)),
//                   ],
//                 ),
//                 CustomPaint(
//                   size: Size(screenWidth, 10),
//                   painter: DashedDividerPainter(),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Total',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black)),
//                     Text('434',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DashedDividerPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     double dashWidth = 10;
//     double dashSpacing = 5;
//     double startX = 0;

//     while (startX < size.width) {
//       canvas.drawLine(
//         Offset(startX, size.height / 2),
//         Offset(startX + dashWidth, size.height / 2),
//         paint,
//       );
//       startX += dashWidth + dashSpacing;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
