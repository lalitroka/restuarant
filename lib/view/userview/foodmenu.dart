import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/model/food_order_model.dart';
import 'package:foodmenu/model/menu_model.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_event.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
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
    // for (var category in foodItems) {
    //   for (var food in category.foodItem!) {
    //     String uniqueId = '${category.id}${food.id}';
    //     quantityControllers[uniqueId] = TextEditingController();
    //   }
    // }
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
    final screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<MenuModel> filteredMenus = getFilteredMenu();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Hello Rojina \n',
                          style: AppTextStyles.titlemedium,
                          children: [
                            TextSpan(
                              text: 'What do you want for dinner today?',
                              style: AppTextStyles.titleSmall.copyWith(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _searchController,
                          style: AppTextStyles.searchFilter,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            hintText: 'Search food...',
                            hintStyle: AppTextStyles.searchFilter,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<String>(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.filter_list_alt,
                          color: Colors.white,
                        ),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: AppTextStyles.titlemedium,
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(20),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Popular food right now',
                    style: AppTextStyles.titlemedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 49, 59, 65),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Image(
                                    height: 100,
                                    width: 140,
                                    image: AssetImage('assets/burger.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                      width:
                                          5), // Spacing between icon and text
                                  Text(
                                    'Fastfood',
                                    style: AppTextStyles.titleSmall,
                                  ),

                                  Text(
                                    'teasty food',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(color: Colors.white70),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$6.6',
                                        style: AppTextStyles.titleSmall,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.heart_broken_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '43',
                                            style: AppTextStyles.titleSmall
                                                .copyWith(
                                                    color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Special For You',
                    style: AppTextStyles.titlemedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 9,
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
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.lightGreen),
                                  child: Icon(
                                    size: 30,
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Stack _topRowContainer(double screenWidth, BuildContext context) {
    return Stack(
      children: [
        buildDecorativeLeaf(
            assetPath: 'assets/leaf.png',
            angle: 300 / 180,
            alignment: Alignment.topLeft),
        Positioned(
          left: screenWidth * 0.64,
          child: buildDecorativeLeaf(
              assetPath: 'assets/leave.png',
              angle: 1 / 180,
              alignment: Alignment.topRight),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Khaja Guff', style: AppTextStyles.displayLarge),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        width: isExpand
                            ? (isshowOrderButton > 0
                                ? screenWidth * 0.6
                                : screenWidth * 0.8)
                            : 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: isExpand ? Border.all(width: 1) : null,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpand = !isExpand;
                              if (!isExpand) {
                                _focusNode.unfocus();
                              } else {
                                _focusNode.requestFocus();
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  weight: 10,
                                ),
                              ),
                              if (isExpand)
                                Expanded(
                                  child: TextField(
                                    focusNode: _focusNode,
                                    controller: _searchController,
                                    style: AppTextStyles.searchFilter,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                      hintText: 'Search...',
                                      hintStyle: AppTextStyles.searchFilter,
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      log("TextField input: $value");
                                    },
                                  ),
                                ),
                              if (isExpand)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (selectedFilter != 'All')
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          children: [
                                            Text(selectedFilter,
                                                style:
                                                    AppTextStyles.searchFilter),
                                            IconButton(
                                              icon: Icon(Icons.cancel,
                                                  color: Colors.white),
                                              onPressed: () {
                                                setState(() {
                                                  selectedFilter = 'All';
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (selectedFilter == "All")
                                      PopupMenuButton<String>(
                                        color: Colors.black,
                                        icon: Icon(
                                          Icons.filter_list_alt,
                                          color: Colors.white,
                                        ),
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
                                                  style: AppTextStyles
                                                      .searchFilter),
                                            ),
                                            PopupMenuItem(
                                              value: 'Non-Veg',
                                              child: Text('Non-Veg',
                                                  style: AppTextStyles
                                                      .searchFilter),
                                            ),
                                          ];
                                        },
                                      ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (isshowOrderButton >= 1)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/orderpage');
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Order',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showUserTextfield(
    BuildContext context,
    FoodModel food,
    MenuModel foodData,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 58, 49, 49),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: RichText(
                  text: TextSpan(
                      text: 'Food: ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: food.foodName,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/fooddescriptionview');
                },
                child: Expanded(
                  flex: 1,
                  child: Text(
                    'See more...',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: quantityControllers,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    border: OutlineInputBorder(),
                    labelText: "Quantity",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                        color: Colors.white)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String uniqueId2 = '${foodData.id}${food.id}';
                      int? foodId = int.tryParse(uniqueId2);
                      log("Generated Unique ID: $uniqueId2");

                      context.read<FoodOrderBloc>().add(
                            FoodOrderRequestEvent(
                              foodRequestItem: [
                                FoodOrderModel(
                                  id: foodId!,
                                  foodName: food.foodName,
                                  foodPrice: food.foodPrice,
                                  foodQuantity:
                                      int.parse(quantityControllers.text),
                                ),
                              ],
                            ),
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 300),
                          content: Text('${food.foodName} Ordered'),
                        ),
                      );

                      setState(() {
                        isshowOrderButton++;
                      });

                      Navigator.pop(context);
                    },
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Row buildbottomRow() {
  //   return Row(
  //     children: [
  //       Stack(
  //         children: [
  //           Transform.rotate(
  //             angle: 180 / 11.5,
  //             child: Image.asset(
  //               'assets/leave.png',
  //               height: 140,
  //             ),
  //           ),
  //           Positioned(
  //               top: 1,
  //               right: 1,
  //               child: Transform.rotate(
  //                 angle: 45 * 44 / 180,
  //                 child: Image.asset(
  //                   'assets/leaf.png',
  //                   height: 140,
  //                 ),
  //               )),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  build3dview(String imageLink) {
    return SizedBox(
      height: 140,
      width: 140,
      child: Flutter3DViewer(controller: imageController, src: imageLink),
    );
  }

  Widget _buildFoodImage({required MenuModel foodDataImage}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2,
      ),
      child: UnconstrainedBox(
        clipBehavior: Clip.none,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              width: 160,
              height: 163,
              fit: BoxFit.cover,
              foodDataImage.image!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: 160,
                  height: 163,
                  child: Center(child: Icon(Icons.error)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildDecorativeLeaf(
    {required String assetPath,
    required double angle,
    required Alignment alignment}) {
  return Align(
    alignment: alignment,
    child: Transform.rotate(
      angle: angle,
      child: Image.asset(assetPath, height: 140),
    ),
  );
}
