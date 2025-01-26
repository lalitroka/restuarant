import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/model/menu_model.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserFoodPage extends StatefulWidget {
  const UserFoodPage({super.key});

  @override
  State<UserFoodPage> createState() => _UserFoodPageState();
}

class _UserFoodPageState extends State<UserFoodPage> {
  bool isExpand = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();

    super.dispose();
  }

  //
  Flutter3DController imageController = Flutter3DController();
  TextEditingController quantityControllers = TextEditingController();
  List<MenuModel> foodItems = [];
  String searchQuery = '';
  bool isOrderClick = false;
  int isshowOrderButton = 0;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  List<MenuModel> allMenus = generateMenuData(20, 5);
  String selectedFilter = "All";
  final TextEditingController _searchController = TextEditingController();

  List<MenuModel> getFilteredMenu() {
    String query = _searchController.text.trim().toLowerCase();

    return allMenus
        .map((menu) {
          List<FoodModel> filteredItems = menu.foodItem!.where((food) {
            bool matchesFilter =
                (selectedFilter == "All") || (food.foodType == selectedFilter);
            bool matchesSearch =
                query.isEmpty || food.foodName.toLowerCase().contains(query);
            return matchesFilter && matchesSearch;
          }).toList();

          return MenuModel(
            id: menu.id,
            foodCategory: menu.foodCategory,
            image: menu.image,
            foodItem: filteredItems,
          );
        })
        .where((menu) => menu.foodItem!.isNotEmpty)
        .toList();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    // List<MenuModel> filteredMenus = getFilteredMenu();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: RichText(
                            text: TextSpan(
                                text: "Hello Rojina\n",
                                style: AppTextStyles.titlemedium
                                    .copyWith(fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                      text:
                                          "What do you want for dinner today?",
                                      style: AppTextStyles.titleSmall
                                          .copyWith(color: Colors.white70))
                                ]),
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(
                              'https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _searchController,
                          style: AppTextStyles.bodysmall
                              .copyWith(color: Colors.black),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.amber,
                            prefixIcon: Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            hintText: 'Search food...',
                            hintStyle: AppTextStyles.searchFilter
                                .copyWith(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<String>(
                        color: Colors.black,
                        icon: const Icon(Icons.filter_list_alt,
                            color: Colors.white),
                        onSelected: (filter) {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'Veg',
                              child: Text('Veg',
                                  style: AppTextStyles.searchFilter),
                            ),
                            PopupMenuItem(
                              value: 'Non-Veg',
                              child: Text('Non-Veg',
                                  style: AppTextStyles.searchFilter),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: AppTextStyles.titlemedium
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'See all',
                        style: AppTextStyles.titleSmall
                            .copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 149, 212, 77),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fastfood,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Fastfood',
                                style: AppTextStyles.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular food right now',
                        style: AppTextStyles.titlemedium
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: Container(
                            width: 160,
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 26, 27, 27),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/userfoodcartedpage');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/burger.png',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  Text(
                                    'Fastfood',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    'tasty food',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(color: Colors.white70),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$6.6',
                                          style:
                                              AppTextStyles.titleSmall.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              size: 22,
                                              color: Colors.white70,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '43',
                                              style: AppTextStyles.titleSmall
                                                  .copyWith(
                                                      color: Colors.white70),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Special For You',
                      style: AppTextStyles.titlemedium
                          .copyWith(fontWeight: FontWeight.w700)),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 27, 27),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                    height: 60,
                                    width: 60,
                                    image: AssetImage('assets/fish.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chicken Burger',
                                      style: AppTextStyles.titleSmall,
                                    ),
                                    Text(
                                      'very tasty food',
                                      style: AppTextStyles.titleSmall.copyWith(
                                          fontSize: 15, color: Colors.white70),
                                    ),
                                    Text(
                                      '3.54',
                                      style: AppTextStyles.titleSmall,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 149, 212, 77),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                      size: 30, Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}



// import 'dart:core';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_3d_controller/flutter_3d_controller.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodmenu/core/utils/app_color.dart';
// import 'package:foodmenu/core/utils/app_text_style.dart';
// import 'package:foodmenu/model/food_order_model.dart';
// import 'package:foodmenu/model/menu_model.dart';
// import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
// import 'package:foodmenu/satatemanagement/foodorder/foodorder_event.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UserFoodPage extends StatefulWidget {
//   const UserFoodPage({super.key});

//   @override
//   State<UserFoodPage> createState() => _UserFoodPageState();
// }

// class _UserFoodPageState extends State<UserFoodPage> {
//   bool isExpand = false;

//   final FocusNode _focusNode = FocusNode();

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _searchController.dispose();

//     super.dispose();
//   }

//   //
//   Flutter3DController imageController = Flutter3DController();
//   TextEditingController quantityControllers = TextEditingController();
//   List<MenuModel> foodItems = [];
//   String searchQuery = '';
//   bool isOrderClick = false;
//   int isshowOrderButton = 0;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//   }

//   List<MenuModel> allMenus = generateMenuData(20, 5);
//   String selectedFilter = "All";
//   final TextEditingController _searchController = TextEditingController();

//   List<MenuModel> getFilteredMenu() {
//     String query = _searchController.text.trim().toLowerCase();

//     return allMenus
//         .map((menu) {
//           List<FoodModel> filteredItems = menu.foodItem!.where((food) {
//             bool matchesFilter =
//                 (selectedFilter == "All") || (food.foodType == selectedFilter);
//             bool matchesSearch =
//                 query.isEmpty || food.foodName.toLowerCase().contains(query);
//             return matchesFilter && matchesSearch;
//           }).toList();

//           return MenuModel(
//             id: menu.id,
//             foodCategory: menu.foodCategory,
//             image: menu.image,
//             foodItem: filteredItems,
//           );
//         })
//         .where((menu) => menu.foodItem!.isNotEmpty)
//         .toList();
//   }

//   void _onSearchChanged() {
//     setState(() {});
//   }

//   void onFilterSelected(String filter) {
//     setState(() {
//       selectedFilter = filter;
//     });
//   }

//   List<Map<String, dynamic>> foodname = [
//     {
//       'image':
//           "https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg",
//       'name': "Burger",
//       'price': '5.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg",
//       'name': "Pizza",
//       'price': '8.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/628776/pexels-photo-628776.jpeg",
//       'name': "Pasta",
//       'price': '7.49',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg",
//       'name': "Salad",
//       'price': '4.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/3577562/pexels-photo-3577562.jpeg",
//       'name': "Sushi",
//       'price': '12.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/1600712/pexels-photo-1600712.jpeg",
//       'name': "Sandwich",
//       'price': '6.49',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/1860204/pexels-photo-1860204.jpeg",
//       'name': "Steak",
//       'price': '15.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/4518765/pexels-photo-4518765.jpeg",
//       'name': "Soup",
//       'price': '3.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg",
//       'name': "Fries",
//       'price': '2.99',
//     },
//     {
//       'image':
//           "https://images.pexels.com/photos/1352292/pexels-photo-1352292.jpeg",
//       'name': "Ice Cream",
//       'price': '4.49',
//     },
//   ];

//   final List<Color> predefinedColors = [
//     Colors.red[300]!,
//     Colors.blue[300]!,
//     Colors.green[300]!,
//     const Color.fromARGB(136, 71, 53, 53),
//     Colors.purple[300]!,
//     Colors.teal[300]!,
//     const Color.fromARGB(137, 73, 44, 44)
//   ];

//   final Random _random = Random();

//   Color getRandomPredefinedColor() {
//     return Color.fromRGBO(
//         _random.nextInt(225), _random.nextInt(225), _random.nextInt(225), 10);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final screenHeight = MediaQuery.of(context).size.height;
//     // final double screenWidth = MediaQuery.of(context).size.width;
//     // List<MenuModel> filteredMenus = getFilteredMenu();
//     return Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: AppColor.bodyColor,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: AppColor.backgroundColor,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30))),
//               child: SafeArea(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
//                   child: Column(
//                     spacing: 5,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text(
//                                 "Are You Hungry",
//                                 style: AppTextStyles.titleSmall.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.black),
//                               )),
//                           GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 4, vertical: 2),
//                                 decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Row(
//                                   spacing: 8,
//                                   children: [
//                                     Icon(
//                                       Icons.padding_rounded,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                     Text('3',
//                                         style: AppTextStyles.titleSmall
//                                             .copyWith(color: Colors.black))
//                                   ],
//                                 ),
//                               )),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               focusNode: _focusNode,
//                               controller: _searchController,
//                               style: AppTextStyles.bodysmall
//                                   .copyWith(color: Colors.black),
//                               cursorColor: Colors.white,
//                               decoration: InputDecoration(
//                                 fillColor: Colors.amber,
//                                 prefixIcon: Icon(Icons.search),
//                                 contentPadding: const EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 20),
//                                 hintText: 'Search food...',
//                                 hintStyle: AppTextStyles.searchFilter
//                                     .copyWith(color: Colors.black),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           PopupMenuButton<String>(
//                             color: Colors.black,
//                             icon: const Icon(
//                               Icons.filter_list_alt,
//                             ),
//                             onSelected: (filter) {
//                               setState(() {
//                                 selectedFilter = filter;
//                               });
//                             },
//                             itemBuilder: (BuildContext context) {
//                               return [
//                                 PopupMenuItem(
//                                   value: 'Veg',
//                                   child: Text('Veg',
//                                       style: AppTextStyles.searchFilter),
//                                 ),
//                                 PopupMenuItem(
//                                   value: 'Non-Veg',
//                                   child: Text('Non-Veg',
//                                       style: AppTextStyles.searchFilter),
//                                 ),
//                               ];
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: 40,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(
//                       left: 15,
//                     ),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/userfoodcartedpage');
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 5,
//                         ),
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 51, 178, 68),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.fastfood,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Fastfood',
//                               style: AppTextStyles.titleSmall,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Top Categories',
//                     style: AppTextStyles.titlemedium.copyWith(
//                         color: Colors.black, fontWeight: FontWeight.w700),
//                   ),
//                   Row(
//                     spacing: 3,
//                     children: [
//                       Text(
//                         'See all',
//                         style: AppTextStyles.titleSmall
//                             .copyWith(color: Colors.black45),
//                       ),
//                       Transform.flip(
//                           flipX: true,
//                           child: Icon(
//                             Icons.arrow_back_ios_new,
//                             size: 12,
//                           ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: foodname.length,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   mainAxisExtent: 190,
//                 ),
//                 itemBuilder: (context, index) {
//                   final image = foodname[index].values.elementAt(0);
//                   final name = foodname[index].values.elementAt(1);
//                   final price = foodname[index].values.elementAt(2);

//                   return Stack(children: [
//                     Positioned(
//                       child: Container(
//                         padding: EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient (
//                               colors: [
//                                 getRandomPredefinedColor(),
//                                 getRandomPredefinedColor(),
//                               ],
//                               begin: Alignment.topRight,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             if (image.isEmpty)
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Image(
//                                   height: 80,
//                                   width: 80,
//                                   image: NetworkImage(image),
//                                   fit: BoxFit.cover,
//                                 ),
//                               )
//                             else
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image(
//                                     height: 80,
//                                     width: 80,
//                                     image: AssetImage(
//                                       "assets/burger.png",
//                                     ),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             SizedBox(height: 12),
//                             Text(
//                               name,
//                               style: AppTextStyles.titleSmall,
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               price,
//                               style: AppTextStyles.titleSmall,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 5,
//                       right: 5,
//                       child: Icon(
//                         Icons.favorite_border_outlined,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.only(
//                           top: 8,
//                           left: 8,
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                             )),
//                         child: Container(
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text('Add', style: AppTextStyles.bodysmall),
//                         ),
//                       ),
//                     )
//                   ]);
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ));
//   }



