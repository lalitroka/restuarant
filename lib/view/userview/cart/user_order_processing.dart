import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserOrderProcessingTab extends StatefulWidget {
  const UserOrderProcessingTab({super.key});

  @override
  State<UserOrderProcessingTab> createState() => _UserOrderProcessingTabState();
}

class _UserOrderProcessingTabState extends State<UserOrderProcessingTab> {
  List<Map<dynamic, dynamic>> foodDetail = [
    {'foodname': 'pizza pizza pizza', 'price': '6350', 'quantity': 15},
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Food',
                    style: AppTextStyles.titleSmall,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Quantity',
                    style: AppTextStyles.titleSmall,
                  ),
                  Text(
                    'price',
                    style: AppTextStyles.titleSmall,
                  )
                ],
              ),
            ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.4,
                                child: Text(
                                  food,
                                  style: AppTextStyles.titleSmall
                                      .copyWith(fontSize: 15),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                quantity.toString(),
                                style: AppTextStyles.titleSmall
                                    .copyWith(fontSize: 15),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: Center(
                                  child: Text(
                                    '\$$price',
                                    softWrap: true,
                                    style: AppTextStyles.titleSmall,
                                  ),
                                ),
                              )
                            ]));
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: AppTextStyles.titlemedium,
                  ),
                  Text(
                    '\$994',
                    style: AppTextStyles.titlemedium,
                  ),
                ],
              ),
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
                  child: Text('Pay', style: AppTextStyles.headlineLarge),
                )),
          ],
        )),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:foodmenu/core/utils/app_text_style.dart';

// class UserOrderProcessingTab extends StatefulWidget {
//   const UserOrderProcessingTab({super.key});

//   @override
//   State<UserOrderProcessingTab> createState() => _UserOrderProcessingTabState();
// }

// class _UserOrderProcessingTabState extends State<UserOrderProcessingTab> {
//   List<Map<dynamic, dynamic>> foodDetail = [
//     {'foodname': 'pizza', 'price': '6350', 'quantity': 15},
//     {'foodname': 'pasta', 'price': '520', 'quantity': 1},
//     {'foodname': 'sandwich', 'price': '300', 'quantity': 1},
//     {'foodname': 'sushi', 'price': '890', 'quantity': 1},
//     {'foodname': 'taco', 'price': '410', 'quantity': 1},
//     {'foodname': 'noodles', 'price': '350', 'quantity': 1},
//      {
//       'foodname': 'burger burgerbur ger burger burger ',
//       'price': '4624',
//       'quantity': 21
//     },
//     {'foodname': 'steak', 'price': '1200', 'quantity': 1},
//     {'foodname': 'salad', 'price': '280', 'quantity': 1},
//     {'foodname': 'fries', 'price': '250', 'quantity': 1}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: CustomPaint(
  
//         child: SafeArea(
//             child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: screenHeight * 0.67,
//               child: ListView.builder(
//                   itemCount: foodDetail.length,
//                   itemBuilder: (context, index) {
//                     final food = foodDetail[index].values.elementAt(0);
//                     final price = foodDetail[index].values.elementAt(1);
//                     final quantity = foodDetail[index].values.elementAt(2);
//                     return  Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 20),
//                             margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
//                             decoration: BoxDecoration(
//                                color: const Color.fromARGB(255, 243, 232, 232),
//                                 borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   height: 80,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.blueGrey, width: 4),
//                                      borderRadius: BorderRadius.circular(20),
//                                       image: DecorationImage(
//                                           image:
//                                               AssetImage('assets/food.jpg'),
//                                               fit: BoxFit.cover
//                                               )),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 SizedBox(
//                               width: screenWidth * 0.4,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                     spacing: 3,
//                                     children: [
//                                       Text(
//                                         food[0].toUpperCase() +
//                                             food.substring(1),
//                                         style: AppTextStyles.titleSmall.copyWith(color: Colors.black),
//                                       ),

//                                       Text(
//                                         'Rs.$price',
//                                         style: AppTextStyles.titleSmall.copyWith(color: Colors.blue),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 Spacer(),
//                                 Text(
//                                         quantity.toString(),
//                                         style: AppTextStyles.titleSmall.copyWith(color: Colors.blue),
//                                       ),
                              
//                               ],
//                             ));
//                   }),
//             ),
//             SizedBox(height: 10,),
          
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total',
//                     style: AppTextStyles.titlemedium.copyWith(color: Colors.black),
//                   ),
//                   Text(
//                     '\$994',
//                     style: AppTextStyles.titlemedium.copyWith(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//                 onTap: () => Navigator.pushNamed(context, '/userpaymentpage'),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.lightGreen),
//                   child: Text('Pay', style: AppTextStyles.headlineLarge),
//                 )),
//           ],
//         )),
//       ),
//     );
//   }
// }



