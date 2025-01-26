

import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:foodmenu/view/userview/user_homepage.dart';

class UserFoodCartedPage extends StatefulWidget {
  const UserFoodCartedPage({super.key});

  @override
  State<UserFoodCartedPage> createState() => _UserFoodCartedPageState();
}

class _UserFoodCartedPageState extends State<UserFoodCartedPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  child: Image(
                    height: 350,
                    width: screenWidth,
                    image: const AssetImage('assets/food.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
                Positioned(
                  top: 290,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 69, 49, 49),
                        borderRadius: BorderRadiusDirectional.circular(40)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Burger \n',
                                style: AppTextStyles.titlemedium,
                                children: [
                                  TextSpan(
                                    text: 'one of the most popular food',
                                    style: AppTextStyles.titleSmall.copyWith(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '\$ 5.4',
                              style: AppTextStyles.titlemedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '44.4',
                                  style: AppTextStyles.titleSmall,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '10 to 20 min',
                                  style: AppTextStyles.titleSmall,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 440,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppTextStyles.titlelarge,
                      ),
                      Text(
                        ''' Discover a wide variety of delicious, freshly prepared meals designed to satisfy every craving. From savory appetizers to hearty main courses and decadent desserts ''',
                        style: AppTextStyles.titleSmall,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Size',
                        style: AppTextStyles.titlelarge,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 2),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 41, 48, 52),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  // color: Colors.red,
                                  width: 2,
                                )),
                            child: Text(
                              'S',
                              style: AppTextStyles.titlelarge,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 41, 48, 52),
                                border: Border.all(
                                  // color: Colors.red,
                                  width: 2,
                                )),
                            child: Text(
                              'M',
                              style: AppTextStyles.titlelarge,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                )),
                            child: Text(
                              'L',
                              style: AppTextStyles.titlelarge,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 41, 48, 52),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  '3',
                                  style: AppTextStyles.titleSmall,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(selectedIndex: 1,) ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),    
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 112, 156, 61)),
                              child: Center(
                                  child: Text(
                                'Add to Cart',
                                style: AppTextStyles.titlelarge,
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      )
      )
      );
  }

 }
  







// import 'package:flutter/material.dart';
// import 'package:foodmenu/core/utils/app_color.dart';
// import 'package:foodmenu/core/utils/app_text_style.dart';

// class UserFoodCartedPage extends StatefulWidget {
//   const UserFoodCartedPage({super.key});

//   @override
//   State<UserFoodCartedPage> createState() => _UserFoodCartedPageState();
// }

// class _UserFoodCartedPageState extends State<UserFoodCartedPage> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
    
//     return Scaffold(
//       backgroundColor: AppColor.bodyColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: AppColor.backgroundColor,
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: _iconContainer(Icons.arrow_back_ios_new),
//                     ),
//                     Row(
//                       children: [
//                         _iconContainer(Icons.favorite_border_outlined),
//                         const SizedBox(width: 10),
//                         _iconContainer(Icons.shopping_cart_outlined),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               ClipPath(
//                 clipper: CurvedBackgroundClipper(),
//                 child: Container(
//                   height: screenHeight * 0.4,
//                   width: screenWidth,
//                   color: AppColor.backgroundColor
//                 ),
//               ),
//               Positioned(
//                 top: screenHeight * 0.1,
//                 child: CircleAvatar(
//                   radius: screenHeight * 0.15,
//                   backgroundImage: const AssetImage("assets/food.jpg"),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Pasta',
//                   style: AppTextStyles.titlelarge.copyWith(color: Colors.black, fontSize: 18),
//                 ),
//                 _quantitySelector(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Description',
//                   style: AppTextStyles.titlelarge.copyWith(color: Colors.black, fontSize: 18),
//                 ),
//                 Text(
//                   '''Discover a wide variety of delicious, freshly prepared meals designed to satisfy every craving.''',
//                   style: AppTextStyles.bodysmall.copyWith(color: Colors.black45),
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _textContainer("Delivery", '20 min'),
//                 _textContainer('Calories', '54 kcal'),
//                 Container(
//       padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColor.backgroundColor,
//         borderRadius: BorderRadius.circular(30)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "Rating",
//             style: AppTextStyles.bodysmall.copyWith(color: Colors.black),
//           ),
//           Row(
//             spacing: 5,
//             children: [
//               Icon(Icons.star,color: const Color.fromARGB(255, 231, 231, 78),),
//               Text(
//                 '5',
//                 style: AppTextStyles.bodysmall.copyWith(color: Colors.black54),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(15),
//             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 132, 112, 112),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Rs. 34434',
//                   style: AppTextStyles.titleSmall.copyWith(color: Colors.white),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   child: Text(
//                     'Add to cart',
//                     style:
//                         AppTextStyles.bodysmall.copyWith(color: Colors.black),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _iconContainer(IconData icon) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       decoration:
//           BoxDecoration(border: Border.all(color: Colors.black26), shape: BoxShape.circle),
//       child: Icon(icon, size: 20,),
//     );
//   }

//   Widget _textContainer(String titleName, String subtitle) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColor.backgroundColor, 
//         borderRadius: BorderRadius.circular(30)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             titleName,
//             style: AppTextStyles.bodysmall.copyWith(color: Colors.black, ),
//           ),
//           Text(
//             subtitle,
//             style: AppTextStyles.bodysmall.copyWith(color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _quantitySelector() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//       decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 132, 112, 112),
//           borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         children: [
//           const Icon(Icons.remove, color: Colors.white, size: 17,),
//           const SizedBox(width: 10),
//           Text('3', style: AppTextStyles.titleSmall.copyWith(color: Colors.white)),
//           const SizedBox(width: 10),
//           const Icon(Icons.add, color: Colors.white, size: 17,),
//         ],
//       ),
//     );
//   }
// }

// class CurvedBackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size){
//     Path path = Path();
//     path.lineTo(0, size.height * 0.6);
//     path.quadraticBezierTo(size.width /2, size.height, size.width, size.height * 0.6);
//     path.lineTo(size.width, 0);
//    return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
