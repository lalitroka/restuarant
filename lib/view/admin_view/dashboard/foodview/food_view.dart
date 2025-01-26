import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminFoodViewPage extends StatefulWidget {
  const AdminFoodViewPage({super.key});

  @override
  State<AdminFoodViewPage> createState() => _AdminFoodViewPageState();
}

class _AdminFoodViewPageState extends State<AdminFoodViewPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Spacer(),
                        Text('View', style: AppTextStyles.headlineLarge),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: screenHeight,
                      child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                        builder: (context, categoryState) {
                          if (categoryState is FoodCategoryAddState) {
                            final insertedCategories =
                                categoryState.categoryModel;
                            return ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: insertedCategories.length,
                              itemBuilder: (context, index) {
                                final category = insertedCategories[index];
                                final isImageFirst = index % 2 == 1;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (isImageFirst)
                                      BlocBuilder<ImageaddBloc, ImageaddState>(
                                          builder: (context, imageState) {
                                        if (imageState is FoodImageAddState) {
                                          final imageUrl =
                                              imageState.imageModel;
                                          if (imageUrl.isNotEmpty) {
                                            return Builder(builder: (context) {
                                              return SizedBox(
                                                height: 150,
                                                width: 150,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 10,
                                                  ),
                                                  itemCount: imageUrl.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    final imagePath =
                                                        imageUrl[index];
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.file(
                                                        File(
                                                            imagePath.imageUrl),
                                                        fit: BoxFit.cover,
                                                        height: 150,
                                                        width: 150,
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.amberAccent),
                                        );
                                      }),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7),
                                            width: 170,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.yellow),
                                            child: Text(
                                              category.name,
                                              style: AppTextStyles.titlelarge
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                          ),

                                          //
                                          //
                                          //
                                          //
                                          //
                                          //
                                          SizedBox(
                                            height: 10,
                                          ),
                                          BlocBuilder<FoodItemBloc,
                                              FoodItemState>(
                                            builder: (context, foodState) {
                                              if (foodState
                                                  is FoodItemAddState) {
                                                final foodItems =
                                                    foodState.foodItem;
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: foodItems.length,
                                                  itemBuilder:
                                                      (context, itemIndex) {
                                                    final foodItem =
                                                        foodItems[itemIndex];
                                                    return Column(
                                                      children: [
                                                        ConstrainedBox(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth: double
                                                                      .infinity),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  '/fooddescriptionview');
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 153,
                                                                  child: Text(
                                                                    foodItem
                                                                        .name,
                                                                    style: AppTextStyles
                                                                        .titlemedium,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    '\$${foodItem.price.toStringAsFixed(1)}',
                                                                    style: AppTextStyles
                                                                        .titlemedium,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        BlocBuilder<
                                                            FoodSizeAddBloc,
                                                            FoodSizeAddState>(
                                                          builder: (context,
                                                              sizeState) {
                                                            if (sizeState
                                                                is FoodItemSizeAddState) {
                                                              final sizes =
                                                                  sizeState
                                                                      .foodSizeModel;
                                                              return ListView
                                                                  .builder(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                itemCount: sizes
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        sizeIndex) {
                                                                  final sizeData =
                                                                      sizes[
                                                                          sizeIndex];
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: SizedBox(
                                                                                width: 153,
                                                                                child: Text(
                                                                                  sizeData.size,
                                                                                  style: AppTextStyles.titlemedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Text(
                                                                                '\$${sizeData.price.toStringAsFixed(1)}',
                                                                                style: AppTextStyles.titlemedium,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                            return const SizedBox();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                              return const SizedBox(
                                                  child: Text(
                                                      'Food items not found'));
                                            },
                                          ),

                                          //
                                          //
                                          //
                                          //
                                          //
                                          //
                                          //
                                          //
                                          //
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    if (!isImageFirst)
                                      BlocBuilder<ImageaddBloc, ImageaddState>(
                                          builder: (context, imageState) {
                                        if (imageState is FoodImageAddState) {
                                          final imageUrl =
                                              imageState.imageModel;
                                          if (imageUrl.isNotEmpty) {
                                            return Builder(builder: (context) {
                                              return SizedBox(
                                                height: 150,
                                                width: 150,
                                                child: ListView.builder(
                                                  itemCount: imageUrl.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    final imagePath =
                                                        imageUrl[index];
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.file(
                                                        File(
                                                            imagePath.imageUrl),
                                                        fit: BoxFit.cover,
                                                        height: 150,
                                                        width: 150,
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.amberAccent),
                                        );
                                      }),
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
