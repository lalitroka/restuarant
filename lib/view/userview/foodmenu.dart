import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/model/food_order_model.dart';
import 'package:foodmenu/model/menu_model.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_event.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:foodmenu/view/userview/menu_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  Flutter3DController imageController = Flutter3DController();
  Map<String, TextEditingController> quantityControllers = {};
  Map<String, TextEditingController> peopleControllers = {};
  List<MenuModel> foodItems = [];
  String searchQuery = '';
  Set<String> foodClick = {};
  Map<String, bool> foodOrderState = {};
  Set<int> hiddenCategories = {};

  @override
  void initState() {
    foodItems = generateMenuData(20, 5);
    for (var category in foodItems) {
      for (var food in category.foodItem!) {
        String uniqueId = '${category.id}${food.id}';
        quantityControllers[uniqueId] = TextEditingController();
        peopleControllers[uniqueId] = TextEditingController();
      }
    }
    super.initState();
  }

  void toggleCategoryImageVisibility(int categoryId) {
    setState(() {
      if (hiddenCategories.contains(categoryId)) {
        hiddenCategories.remove(categoryId);
      } else {
        hiddenCategories.add(categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BuildTopRow(screenHeight: screenHeight, screenWidth: screenWidth),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                children: [
                  ExpandedSearchBar(),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Order',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Stack(children: [
                Positioned.fill(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    shrinkWrap: true,
                    itemCount: foodItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final foodData = foodItems[index];
                      final isImageFirst = index % 2 == 1;
                      for (var food in foodItems) {
                        String uniqueId = '${foodData.id}${food.id}';
                        int newId = int.parse(uniqueId);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (isImageFirst &&
                                  !hiddenCategories.contains(newId)) ...[
                                _buildFoodImage(foodDataImage: foodData),
                                SizedBox(width: 10),
                              ],
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FoodCategoryTextContainer(
                                      foodCategoryName: foodData.foodCategory!,
                                    ),
                                    SizedBox(height: 10),
                                    for (var food in foodData.foodItem!) ...[
                                      ValueListenableBuilder<bool>(
                                        valueListenable: ValueNotifier(
                                            foodClick.contains(
                                                '${foodData.id}${food.id}')),
                                        builder: (context, isClicked, child) {
                                          String uniqueId2 =
                                              '${foodData.id}${food.id}';
                                          bool isOrderClick =
                                              foodOrderState[uniqueId2] ??
                                                  false;
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  toggleCategoryImageVisibility(
                                                      newId);
                                                  final uniqueId2 =
                                                      '${foodData.id}${food.id}';

                                                  setState(() {
                                                    if (foodClick
                                                        .contains(uniqueId2)) {
                                                      foodClick
                                                          .remove(uniqueId2);
                                                    } else {
                                                      foodClick.add(uniqueId2);
                                                    }
                                                  });
                                                },
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          double.infinity),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      FoodNameText(
                                                          foodName:
                                                              food.foodName),
                                                      Spacer(),
                                                      FoodPriceText(
                                                        foodPrice: food
                                                            .foodprice
                                                            .toDouble(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (isClicked) ...[
                                                Row(
                                                  children: [
                                                    TextFieldContainer(
                                                      controllerType:
                                                          quantityControllers[
                                                              '${foodData.id}${food.id}']!,
                                                      labelText: 'Quantity',
                                                    ),
                                                    TextFieldContainer(
                                                      controllerType:
                                                          peopleControllers[
                                                              '${foodData.id}${food.id}']!,
                                                      labelText: 'People',
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        String uniqueId2 =
                                                            '${foodData.id}${food.id}';
                                                        int foodId = int.parse(
                                                            uniqueId2);

                                                        if (isOrderClick) {
                                                          context
                                                              .read<
                                                                  FoodOrderBloc>()
                                                              .add(
                                                                FoodOrderCancelEvent(
                                                                    foodCancelItem:
                                                                        foodId),
                                                              );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              content: Text(
                                                                  '${food.foodName}Order Cancelled'),
                                                            ),
                                                          );
                                                        } else {
                                                          List<FoodOrderModel>
                                                              selectedFoods = [
                                                            FoodOrderModel(
                                                              id: foodId,
                                                              foodName:
                                                                  food.foodName,
                                                              foodPrice: food
                                                                  .foodprice,
                                                              foodQuantity:
                                                                  int.parse(
                                                                quantityControllers[
                                                                            uniqueId2]
                                                                        ?.text ??
                                                                    '0',
                                                              ),
                                                              numberOfPeople:
                                                                  int.parse(
                                                                peopleControllers[
                                                                            uniqueId2]
                                                                        ?.text ??
                                                                    '0',
                                                              ),
                                                            ),
                                                          ];
                                                          context
                                                              .read<
                                                                  FoodOrderBloc>()
                                                              .add(
                                                                FoodOrderRequestEvent(
                                                                  foodRequestItem:
                                                                      selectedFoods,
                                                                ),
                                                              );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              content: Text(
                                                                  '${food.foodName}is Ordered'),
                                                            ),
                                                          );
                                                        }
                                                        setState(() {
                                                          foodOrderState[
                                                                  uniqueId2] =
                                                              !isOrderClick;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 39,
                                                        width: 74,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5,
                                                                vertical: 2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isOrderClick
                                                              ? Colors.red
                                                              : Colors.yellow,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            isOrderClick
                                                                ? 'Cancel'
                                                                : 'Order',
                                                            style: GoogleFonts
                                                                .rubik(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              if (!isImageFirst &&
                                  !hiddenCategories.contains(newId)) ...[
                                SizedBox(width: 10),
                                _buildFoodImage(foodDataImage: foodData),
                              ],
                            ],
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ]),
            ),
          ]),
        ),
      )),
      floatingActionButton: foodClick.isNotEmpty
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/orderpage');
              },
              child: Positioned(child: confirmContainer()))
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget confirmContainer() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(color: Colors.amber),
      child: Center(
          child: Text(
        'Confirm Order',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
      )),
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

class BuildTopRow extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const BuildTopRow({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
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
              Text(
                'FOOD MENU',
                style: GoogleFonts.kanit(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Kathmandu Restaurant',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
}
