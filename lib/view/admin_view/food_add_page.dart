// import 'package:flutter/material.dart';
// import 'package:foodmenu/view/commonwidgets/background_painter.dart';
// import 'package:google_fonts/google_fonts.dart';

// class FoodAddPage extends StatefulWidget {
//   const FoodAddPage({super.key});

//   @override
//   State<FoodAddPage> createState() => _FoodAddPageState();
// }

// class _FoodAddPageState extends State<FoodAddPage> {
//   List<Widget> _generateContainers = [];
//   List<Widget> _generateItemsContainer = [];
//   List<Widget> _generateItemSizeContainer = [];

//   void _addCategory() {
//     setState(() {
//       _generateContainers.add(reBuildContainer());
//     });
//   }

//   void _addItems() {
//     setState(() {
//       _generateItemsContainer.add(addItemsContainer());
//     });
//   }

//   void _addSize() {
//     setState(() {
//       _generateItemSizeContainer.add(addSizeContainer());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: CustomPaint(
//         painter: BackgroundPainter(),
//         child: SizedBox.expand(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 400,
//                   child: ListView.separated(
//                     itemCount: 1,
//                     itemBuilder: (context, index) {
//                       return savedFoodCategory();
//                     },
//                     separatorBuilder: (context, index) {
//                       return Divider(
//                         height: 10,
//                       );
//                     },
//                   ),
//                 ),
//                 ..._generateContainers,
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: TextButton(
//                       onPressed: () {
//                         _addCategory();
//                       },
//                       child: Container(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         color: Colors.black,
//                         child: Text(
//                           'Add Category',
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       )),
//                 )
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }

  
//   Column savedFoodCategory() {
//     return Column(
//       spacing: 10,
//       children: [
//         Row(
//           children: [
//             Container(
//               height: 90,
//               width: 90,
//               color: Colors.amber,
//             ),
//             Text(
//               'categoryname',
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             Spacer(),
//             Icon(
//               Icons.expand_more,
//               color: Colors.white,
//             )
//           ],
//         ),
//         ..._generateItemsContainer,
//         TextButton(
//             onPressed: () {
//               _addItems();
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               color: Colors.black,
//               child: Text(
//                 'Add Items',
//                 style: GoogleFonts.poppins(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             )),
//       ],
//     );
//   }

//   Container addItemsContainer() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Food Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10), // Space between text fields
//               Expanded(
//                 flex: 1,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Price',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           SizedBox(
//             height: 70,
//             child: TextField(
//               expands: true,
//               maxLines: null,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),

//           ..._generateItemSizeContainer,
//           Row(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   _addSize();
//                 },
//                 child: Text(
//                   'Add Size',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               Spacer(),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget addSizeContainer() {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: TextField(
//             decoration: InputDecoration(
//               labelText: 'Food Name',
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ),
//         SizedBox(width: 10), // Space between text fields
//         Expanded(
//           flex: 1,
//           child: TextField(
//             decoration: InputDecoration(
//               labelText: 'Price',
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         Icon(Icons.delete),
//       ],
//     );
//   }



// Container reBuildContainer() {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 10),
//     padding: EdgeInsets.all(16),
//     color: Colors.black,
//     child: Column(
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             labelText: 'Category Name',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(height: 10),
//         TextField(
//           decoration: InputDecoration(
//             labelText: 'Category Description',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Cancel',
//                   style: GoogleFonts.poppins(color: Colors.white),
//                 )),
//             TextButton(
//                 onPressed: () {},
//                 child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     // decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(10),
//                     //     color: Colors.black),
//                     child: Text(
//                       'Save',
//                       style: GoogleFonts.poppins(color: Colors.white),
//                     ))),
//           ],
//         )
//       ],
//     ),
//   );
// }
