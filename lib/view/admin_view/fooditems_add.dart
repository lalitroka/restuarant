import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemsAddPage extends StatefulWidget {
  const FoodItemsAddPage({super.key});

  @override
  State<FoodItemsAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodItemsAddPage> {
  List<bool> isCategoryExpand = [];
  void _toggleCategoryExpand(int index) {
    setState(() {
      isCategoryExpand[index] = !isCategoryExpand[index];
    });
  }

  List<bool> isFoodItemExpand = [];
  void _toggleFoodItemExpand(int itemIndex) {
    setState(() {
      isFoodItemExpand[itemIndex] = !isFoodItemExpand[itemIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Add Items',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/foodviewpage');
                      },
                      label: Text(
                        'View',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                    builder: (context, categoryState) {
                      if (categoryState is FoodCategoryAddState) {
                        final insertedData = categoryState.categoryModel;
                        isCategoryExpand = List.generate(
                            insertedData.length,
                            (index) => isCategoryExpand.length > index
                                ? isCategoryExpand[index]
                                : true);
                        return ListView.separated(
                          itemCount: insertedData.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final category = insertedData[index];
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    BlocBuilder<ImageaddBloc, ImageaddState>(
                                        builder: (context, imageState) {
                                      if (imageState is FoodImageAddState) {
                                        final imageUrl = imageState.imageModel;
                                        if (imageUrl.isNotEmpty) {
                                          return Builder(builder: (context) {
                                            return SizedBox(
                                              height: 130,
                                              width: 130,
                                              child: ListView.builder(
                                                itemCount: imageUrl.length,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  final imagePath =
                                                      imageUrl[index];
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.amberAccent,
                                                    ),
                                                    child: Image.file(
                                                      File(imagePath.imageUrl),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          });
                                        }
                                      }
                                      return Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            color: Colors.amberAccent),
                                      );
                                    }),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        category.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      category.id.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        isCategoryExpand[index]
                                            ? Icons.expand_less
                                            : Icons.expand_more,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () =>
                                          _toggleCategoryExpand(index),
                                    ),
                                  ],
                                ),
                                BlocBuilder<FoodItemBloc, FoodItemState>(
                                  builder: (context, foodState) {
                                    if (foodState is FoodItemAddState) {
                                      final foodItems = foodState.foodItem;

                                      isFoodItemExpand = List.generate(
                                          foodItems.length,
                                          (itemIndex) =>
                                              isFoodItemExpand.length >
                                                      itemIndex
                                                  ? isFoodItemExpand[itemIndex]
                                                  : false);

                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: foodItems.length,
                                        itemBuilder: (context, itemIndex) {
                                          final foodItem = foodItems[itemIndex];

                                          final foodItemWidget = Container(
                                            padding:
                                                const EdgeInsets.only(left: 40),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      foodItem.name,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      '\$${foodItem.price}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        _toggleFoodItemExpand(
                                                            itemIndex);
                                                      },
                                                      icon: Icon(
                                                        isFoodItemExpand[
                                                                itemIndex]
                                                            ? Icons.expand_less
                                                            : Icons.expand_more,
                                                        size: 30,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                BlocBuilder<FoodSizeAddBloc,
                                                        FoodSizeAddState>(
                                                    builder: (context, state) {
                                                  if (state
                                                      is FoodItemSizeAddState) {
                                                    final sizes =
                                                        state.foodSizeModel;

                                                    return ListView.builder(
                                                        itemCount: sizes.length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          final sizeData =
                                                              sizes[index];
                                                          final sizeWidgets =
                                                              Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 40,
                                                                    right: 40),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      sizeData
                                                                          .size,
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              19,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    Text(
                                                                      '\$${sizeData.price}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            19,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );

                                                          return isFoodItemExpand[
                                                                  itemIndex]
                                                              ? sizeWidgets
                                                              : const SizedBox();
                                                        });
                                                  }
                                                  return SizedBox();
                                                }),
                                              ],
                                            ),
                                          );

                                          return isCategoryExpand[index]
                                              ? foodItemWidget
                                              : const SizedBox();
                                        },
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                                if (isCategoryExpand[index])
                                  TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.black),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/fooddescription');
                                      },
                                      child: Text(
                                        "Add Items",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      )),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodmenu/model/foodaddmodel.dart';
// import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
// import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
// import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
// import 'package:foodmenu/view/commonwidgets/background_painter.dart';
// import 'package:google_fonts/google_fonts.dart';


// class FoodItemsAddPage extends StatefulWidget {
//   const FoodItemsAddPage({super.key});

//   @override
//   State<FoodItemsAddPage> createState() => _FoodAddPageState();
// }

// class _FoodAddPageState extends State<FoodItemsAddPage> {
//   List<bool> isCategoryExpand = [];

//   final Map<int, TextEditingController> nameitemControllers = {};
//   final Map<int, TextEditingController> descriptionitemControllers = {};
//   final Map<int, TextEditingController> priceitemControllers = {};
//   final Map<int, TextEditingController> sizeitemControllers = {};
//   final Map<int, TextEditingController> smallpriceitemControllers = {};

//   int foodItemCount = 0;
//   int foodSizeCount = 0;
//   final Map<int, int> foodSizeKeys = {};

//   final Map<int, int> foodItemKeys = {};

//   void _addFoodItem(int categoryId, int itemId) {
//     setState(() {
//       itemId = foodItemCount;
//       foodItemKeys.putIfAbsent(itemId, () => categoryId);
//       nameitemControllers[foodItemCount] = TextEditingController();
//       descriptionitemControllers[foodItemCount] = TextEditingController();
//       priceitemControllers[foodItemCount] = TextEditingController();
//       foodItemCount++;
//     });
//   }

//   void _addFoodItemSize(int itemId, int sizeId) {
//     setState(() {
//       sizeId = foodSizeCount;
//       foodSizeKeys.putIfAbsent(sizeId, () => itemId);
//       sizeitemControllers[foodSizeCount] = TextEditingController();
//       smallpriceitemControllers[foodSizeCount] = TextEditingController();
//       foodSizeCount++;
//     });
//   }

//   void _removeFoodItem(int itemKey) {
//     setState(() {
//       foodItemKeys.remove(itemKey);
//       nameitemControllers[itemKey]?.dispose();
//       descriptionitemControllers[itemKey]?.dispose();
//       priceitemControllers[itemKey]?.dispose();
//       nameitemControllers.remove(itemKey);
//       descriptionitemControllers.remove(itemKey);
//       priceitemControllers.remove(itemKey);
//     });
//   }

//   void _removeFoodItemSize(int sizeKey) {
//     setState(() {
//       foodSizeKeys.remove(sizeKey);
//       sizeitemControllers[sizeKey]?.dispose();
//       smallpriceitemControllers[sizeKey]?.dispose();
//       sizeitemControllers.remove(sizeKey);
//       smallpriceitemControllers.remove(sizeKey);
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in nameitemControllers.values) {
//       controller.dispose();
//     }
//     for (var controller in descriptionitemControllers.values) {
//       controller.dispose();
//     }
//     for (var controller in priceitemControllers.values) {
//       controller.dispose();
//     }
//     for (var controller in sizeitemControllers.values) {
//       controller.dispose();
//     }
//     for (var controller in smallpriceitemControllers.values) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   void _toggleCategoryExpand(int index) {
//     setState(() {
//       isCategoryExpand[index] = !isCategoryExpand[index];
//     });
//   }

//   List<bool> isFoodItemExpand = [];
//   void _toggleFoodItemExpand(int itemIndex) {
//     setState(() {
//       isFoodItemExpand[itemIndex] = !isFoodItemExpand[itemIndex];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomPaint(
//           painter: BackgroundPainter(),
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       'Add Items',
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     Spacer(),
//                     TextButton.icon(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/foodviewpage');
//                       },
//                       label: Text(
//                         'View',
//                         style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                       icon: Icon(
//                         Icons.remove_red_eye_outlined,
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
//                     builder: (context, categoryState) {
//                       if (categoryState is FoodCategoryAddState) {
//                         final insertedData = categoryState.categoryModel;
//                         isCategoryExpand = List.generate(
//                             insertedData.length,
//                             (index) => isCategoryExpand.length > index
//                                 ? isCategoryExpand[index]
//                                 : true);
//                         return ListView.separated(
//                           itemCount: insertedData.length,
//                           separatorBuilder: (context, index) =>
//                               const SizedBox(height: 8),
//                           itemBuilder: (context, index) {
//                             final category = insertedData[index];
//                             return Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     BlocBuilder<FoodCategoryBloc,
//                                         FoodCategoryState>(
//                                       builder: (context, state) {
//                                         if (state
//                                             is FoodCategoryImageAddState) {
//                                           final imageFiles = state.imageUrl;
//                                         }
//                                         return Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.amberAccent,
//                                           ),
//                                           height: 140,
//                                           width: 140,
//                                           child: Center(
//                                             child: Text(
//                                               "Select Image",
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                       flex: 3,
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.pushNamed(
//                                               context, '/fooddescription');
//                                         },
//                                         child: Text(
//                                           category.name,
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Text(
//                                       category.id.toString(),
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: Icon(
//                                         isCategoryExpand[index]
//                                             ? Icons.expand_less
//                                             : Icons.expand_more,
//                                         color: Colors.white,
//                                         size: 30,
//                                       ),
//                                       onPressed: () =>
//                                           _toggleCategoryExpand(index),
//                                     ),
//                                   ],
//                                 ),
//                                 BlocBuilder<FoodItemBloc, FoodItemState>(
//                                   builder: (context, foodState) {
//                                     if (foodState is FoodItemAddState) {
//                                       final foodItems = foodState.foodItem;

//                                       isFoodItemExpand = List.generate(
//                                           foodItems.length,
//                                           (itemIndex) =>
//                                               isFoodItemExpand.length >
//                                                       itemIndex
//                                                   ? isFoodItemExpand[itemIndex]
//                                                   : false);

//                                       return ListView.builder(
//                                         shrinkWrap: true,
//                                         physics:
//                                             const NeverScrollableScrollPhysics(),
//                                         itemCount: foodItems.length,
//                                         itemBuilder: (context, itemIndex) {
//                                           final foodItem = foodItems[itemIndex];

//                                           final foodItemWidget = Container(
//                                             padding:
//                                                 const EdgeInsets.only(left: 40),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       foodItem.name,
//                                                       style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                       ),
//                                                     ),
//                                                     Spacer(),
//                                                     Text(
//                                                       '\$${foodItem.price}',
//                                                       style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                       ),
//                                                     ),
//                                                     IconButton(
//                                                       onPressed: () {
//                                                         _toggleFoodItemExpand(
//                                                             itemIndex);
//                                                       },
//                                                       icon: Icon(
//                                                         isFoodItemExpand[
//                                                                 itemIndex]
//                                                             ? Icons.expand_less
//                                                             : Icons.expand_more,
//                                                         size: 30,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 BlocBuilder<FoodSizeAddBloc,
//                                                         FoodSizeAddState>(
//                                                     builder: (context, state) {
//                                                   if (state
//                                                       is FoodItemSizeAddState) {
//                                                     final sizes =
//                                                         state.foodSizeModel;

//                                                     return ListView.builder(
//                                                         itemCount: sizes.length,
//                                                         shrinkWrap: true,
//                                                         physics:
//                                                             const NeverScrollableScrollPhysics(),
//                                                         itemBuilder:
//                                                             (context, index) {
//                                                           final sizeData =
//                                                               sizes[index];
//                                                           final sizeWidgets =
//                                                               Container(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     left: 40,
//                                                                     right: 40),
//                                                             child: Column(
//                                                               children: [
//                                                                 Row(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .spaceBetween,
//                                                                   children: [
//                                                                     Text(
//                                                                       sizeData
//                                                                           .size,
//                                                                       style: const TextStyle(
//                                                                           color: Colors
//                                                                               .white,
//                                                                           fontSize:
//                                                                               19,
//                                                                           fontWeight:
//                                                                               FontWeight.w500),
//                                                                     ),
//                                                                     Text(
//                                                                       '\$${sizeData.price}',
//                                                                       style:
//                                                                           const TextStyle(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                         fontSize:
//                                                                             19,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           );

//                                                           return isFoodItemExpand[
//                                                                   itemIndex]
//                                                               ? sizeWidgets
//                                                               : const SizedBox();
//                                                         });
//                                                   }
//                                                   return SizedBox();
//                                                 }),
//                                               ],
//                                             ),
//                                           );

//                                           return isCategoryExpand[index]
//                                               ? foodItemWidget
//                                               : const SizedBox();
//                                         },
//                                       );
//                                     }
//                                     return const SizedBox();
//                                   },
//                                 ),
//                                 if (isCategoryExpand[index])
//                                   ...foodItemKeys.entries
//                                       .where(
//                                           (entry) => category.id == entry.value)
//                                       .map((entry) => _addItemsContainer(
//                                           category.id, entry.key, entry.value)),
//                                 if (isCategoryExpand[index])
//                                   TextButton(
//                                     onPressed: () => _addFoodItem(
//                                         category.id, foodItemCount),
//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 8, horizontal: 16),
//                                       color: Colors.black,
//                                       child: const Text(
//                                         'Add Items',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             );
//                           },
//                         );
//                       }
//                       return const SizedBox();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
