// import 'package:flutter/material.dart';

// // class AddItems extends StatefulWidget {
// //   const AddItems({super.key});

// //   @override
// //   State<AddItems> createState() => _AddItemsState();
// // }

// // class _AddItemsState extends State<AddItems> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Center(
// //             child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) => AddItems()));
// //                     },
// //                     child: Text("ADD ITEMS")))),
// //       ),
// //     );
// //   }
// // }

// class AddItems extends StatefulWidget {
//   const AddItems({super.key});

//   @override
//   State<AddItems> createState() => _AddItemsState();
// }

// class _AddItemsState extends State<AddItems> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: CustomPaint(
//         painter: BackgroundPainter(),
//         child: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             spacing: 20,
//             children: [
//               Text(
//                 'ADD CATEGORY',
//                 style: TextStyle(fontSize: 24, color: Colors.white),
//               ),
//               Column(
//                 spacing: 20,
//                 children: [
//                   TextField(
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                     decoration: InputDecoration(border: OutlineInputBorder()),
//                   ),
//                   Text(
//                     'ADD ITEMS',
//                     style: TextStyle(fontSize: 24, color: Colors.white),
//                   ),
//                   SizedBox(
//                     height: screenHeight * 0.6,
//                     child: TextField(
//                       textAlignVertical: TextAlignVertical.top,
//                       expands: true,
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                       maxLines: null,
//                       decoration: InputDecoration(border: OutlineInputBorder()),
//                     ),
//                   ),
//                   Container(
//                     child: Text('Push The Items'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         )),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
