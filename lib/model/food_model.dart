











// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MenuWidget extends StatefulWidget {
//   const MenuWidget({super.key});

//   @override
//   State<MenuWidget> createState() => _MenuWidgetState();
// }

// class _MenuWidgetState extends State<MenuWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       if (isImageFirst) ...[
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 2,
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.network(
//                               width: 145,
//                               height: 145,
//                               fit: BoxFit.cover,
//                               foodData.image,
//                               loadingBuilder:
//                                   (context, child, loadingProgress) {
//                                 if (loadingProgress == null) return child;
//                                 return CircularProgressIndicator();
//                               },
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Icon(Icons.error);
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 20),
//                       ],
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               _buildContainer(foodData.foodCategory),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           for (var food
//                                               in foodData.foodItem) ...[
//                                             GestureDetector(
//                                               onTap: () {
//                                                 setState(() {
//                                                   if (orderFood.contains(
//                                                       food.foodName)) {
//                                                     orderFood
//                                                         .remove(food.foodName);
//                                                   } else {
//                                                     orderFood
//                                                         .add(food.foodName);
//                                                   }
//                                                 });
//                                               },
//                                               child: _textBuild(
//                                                   food.foodName, searchQuery),
//                                             ),
//                                             if (orderFood
//                                                 .contains(food.foodName)) ...[
//                                               _orderContainer(),
//                                             ]
//                                           ],
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           for (var food in foodData.foodItem)
//                                             _priceTextBuild(
//                                                 '\$${food.foodprice.toStringAsFixed(2)}'),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       if (!isImageFirst) ...[
//                         SizedBox(width: 20),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             right: 2,
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.network(
//                               height: 145,
//                               width: 145,
//                               fit: BoxFit.cover,
//                               foodData.image,
//                               loadingBuilder:
//                                   (context, child, loadingProgress) {
//                                 if (loadingProgress == null) return child;
//                                 return CircularProgressIndicator();
//                               },
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Icon(Icons.error);
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 );
//   }
// }    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// Text _priceTextBuild(String title) {
//   return Text(
//     title,
//     style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
//   );
// }

// Widget _textBuild(String title, String query) {
//   if (query.isEmpty) {
//     return Text(
//       title,
//       style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
//     );
//   }

//   final queryLower = query.toLowerCase();
//   final titleLower = title.toLowerCase();

//   if (!titleLower.contains(queryLower)) {
//     return Text(
//       title,
//       style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
//     );
//   }

//   final startIndex = titleLower.indexOf(queryLower);
//   final endIndex = startIndex + query.length;

//   final beforeMatch = title.substring(0, startIndex);
//   final match = title.substring(startIndex, endIndex);
//   final afterMatch = title.substring(endIndex);

//   return RichText(
//     text: TextSpan(
//       style: GoogleFonts.rubik(color: Colors.white, fontSize: 15),
//       children: [
//         TextSpan(text: beforeMatch),
//         TextSpan(
//           text: match,
//           style: TextStyle(color: const Color.fromARGB(255, 247, 223, 12)),
//         ),
//         TextSpan(text: afterMatch),
//       ],
//     ),
//   );
// }

// Container _buildContainer(String title) {
//   return Container(
//     width: 120,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5), color: Colors.yellow),
//     child: Text(title,
//         textAlign: TextAlign.center,
//         style: GoogleFonts.kanit(fontSize: 17, fontWeight: FontWeight.w700)),
//   );
// }

// Widget _orderContainer() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
//     decoration: BoxDecoration(
//         color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
//     child: Text(
//       "Order",
//       style: GoogleFonts.rubik(fontSize: 15, color: Colors.black),
//     ),
//   );
// }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//     // SizedBox(
//           //   height: screenHeight * 0.7,
//           //   child: ListView(children: [
//           //     Padding(
//           //       padding: const EdgeInsets.symmetric(horizontal: 20),
//           //       child: Align(
//           //         alignment: Alignment.topLeft,
//           //         child: _buildContainer('MAIN ITEM'),
//           //       ),
//           //     ),
//           //     SizedBox(
//           //       height: 15,
//           //     ),
//           //     Padding(
//           //       padding: const EdgeInsets.symmetric(horizontal: 20),
//           //       child: Row(
//           //         children: [
//           //           Column(
//           //             crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               _textBuild('Cheeseburger'),
//           //               _textBuild('Cheese Sandwich'),
//           //               _textBuild('Chicken Burgers'),
//           //               _textBuild('Beef MoMO'),
//           //               _textBuild('Black Tea'),
//           //               _textBuild('Spicy Chicken'),
//           //               _textBuild('Hot Dog'),
//           //               _textBuild('Chicken Burgers'),
//           //               _textBuild('Beef MoMO'),
//           //               _textBuild('Black Tea'),
//           //               _textBuild('Spicy Chicken'),
//           //               _textBuild('Hot Dog'),
//           //             ],
//           //           ),
//           //           SizedBox(
//           //             width: 20,
//           //           ),
//           //           Column(
//           //             crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               _priceBuild('\$35'),
//           //               _priceBuild('\$32'),
//           //               _priceBuild('\$33'),
//           //               _priceBuild('\$72'),
//           //               _priceBuild('\$38'),
//           //               _priceBuild('\$62'),
//           //               _priceBuild('\$22'),
//           //               _priceBuild('\$72'),
//           //               _priceBuild('\$38'),
//           //               _priceBuild('\$62'),
//           //               _priceBuild('\$22'),
//           //             ],
//           //           ),
//           //           SizedBox(
//           //             width: 30,
//           //           ),
//           //           Image(
//           //             height: 145,
//           //             image: AssetImage('assets/sandwich.png'),
//           //             fit: BoxFit.contain,
//           //           )
//           //         ],
//           //       ),
//           //     ),
//           //     SizedBox(
//           //       height: 20,
//           //     ),
//           //     Padding(
//           //         padding: EdgeInsets.only(left: 190, right: 40),
//           //         child: _buildContainer('APPETIZERS')),
//           //     Row(
//           //       children: [
//           //         Positioned(
//           //           right: 12,
//           //           child: Image(
//           //             height: 170,
//           //             image: AssetImage('assets/burger.png'),
//           //             fit: BoxFit.contain,
//           //           ),
//           //         ),
//           //         SizedBox(
//           //           width: 20,
//           //         ),
//           //         Column(
//           //           crossAxisAlignment: CrossAxisAlignment.start,
//           //           children: [
//           //             _textBuild('Fruit Salad'),
//           //             _textBuild('Cocktails'),
//           //             _textBuild('Buggets'),
//           //             _textBuild('Fresh Juice'),
//           //             _textBuild('Sandwich'),
//           //             _textBuild('Cold Cuts'),
//           //             _textBuild('French Fries'),
//           //           ],
//           //         ),
//           //         SizedBox(
//           //           width: 30,
//           //         ),
//           //         Column(
//           //           crossAxisAlignment: CrossAxisAlignment.start,
//           //           children: [
//           //             _priceBuild('\$95'),
//           //             _priceBuild('\$30'),
//           //             _priceBuild('\$22'),
//           //             _priceBuild('\$12'),
//           //             _priceBuild('\$32'),
//           //             _priceBuild('\$52'),
//           //             _priceBuild('\$12'),
//           //           ],
//           //         ),
//           //       ],
//           //     ),
//           //     SizedBox(
//           //       height: 30,
//           //     ),
//           //     Padding(
//           //       padding: const EdgeInsets.only(left: 30, right: 230),
//           //       child: _buildContainer('BEVERAGE'),
//           //     ),
//           //     SizedBox(
//           //       height: 70,
//           //     ),
//           //     Row(children: [
//           //       Expanded(
//           //         child: Stack(
//           //           clipBehavior: Clip.none,
//           //           children: [
//           //             Transform.rotate(
//           //               angle: 180 / 11.5,
//           //               child: Image.asset(
//           //                 'assets/leave.png',
//           //                 height: 140,
//           //               ),
//           //             ),
//           //             Positioned(
//           //               bottom: 40,
//           //               left: 30,
//           //               child: Column(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: [
//           //                   _textBuild('Milk Shake'),
//           //                   _textBuild('Iced Tea'),
//           //                   _textBuild('Orange Juice'),
//           //                   _textBuild('Meat Balls'),
//           //                   _textBuild('Red Wine'),
//           //                   _textBuild('Lemon Tea'),
//           //                   _textBuild('Iced Coffee'),
//           //                 ],
//           //               ),
//           //             ),
//           //             Positioned(
//           //               bottom: 40,
//           //               left: 170,
//           //               child: Column(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: [
//           //                   _priceBuild('\$315'),
//           //                   _priceBuild('\$32'),
//           //                   _priceBuild('\$39'),
//           //                   _priceBuild('\$92'),
//           //                   _priceBuild('\$333'),
//           //                   _priceBuild('\$662'),
//           //                   _priceBuild('\$24'),
//           //                 ],
//           //               ),
//           //             ),
//           //             Positioned(
//           //               right: 20,
//           //               bottom: 40,
//           //               child: UnconstrainedBox(
//           //                 clipBehavior: Clip.none,
//           //                 child: Image.asset(
//           //                   'assets/fish.png',
//           //                   height: 150,
//           //                   fit: BoxFit.cover,
//           //                 ),
//           //               ),
//           //             ),
//           //             Positioned(
//           //               right: 1,
//           //               child: Transform.rotate(
//           //                 angle: 45 * 44 / 180,
//           //                 child: Image.asset(
//           //                   'assets/leaf.png',
//           //                   height: 140,
//           //                 ),
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ]),
//           //   ]),
//           // ),
