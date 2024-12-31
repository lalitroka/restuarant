import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:foodmenu/view/userview/menu_widget.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
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
                        Text(
                          'View',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
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
                                      BlocBuilder<FoodCategoryBloc,
                                          FoodCategoryState>(
                                        builder: (context, state) {
                                          if (state
                                              is FoodCategoryImageAddState) {
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              height: 140,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.amberAccent,
                                              ),
                                              child: Image.file(state.imageUrl),
                                            );
                                          } else {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.amberAccent,
                                              ),
                                              height: 140,
                                              width: 140,
                                              child: Center(
                                                child: Text(
                                                  "Select Image",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FoodCategoryTextContainer(
                                              foodCategoryName: category.name),

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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                flex: 2,
                                                                child: FoodNameText(
                                                                    foodName:
                                                                        foodItem
                                                                            .name),
                                                              ),
                                                              Flexible(
                                                                flex: 1,
                                                                child: FoodPriceText(
                                                                    foodPrice:
                                                                        foodItem
                                                                            .price),
                                                              ),
                                                            ],
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
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              FoodNameText(foodName: sizeData.size),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              FoodPriceText(foodPrice: sizeData.price),
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
                                          //
                                          //
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    if (!isImageFirst)
                                      BlocBuilder<FoodCategoryBloc,
                                          FoodCategoryState>(
                                        builder: (context, state) {
                                          if (state
                                              is FoodCategoryImageAddState) {
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              height: 140,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.amberAccent,
                                              ),
                                              child: Image.file(state.imageUrl),
                                            );
                                          } else {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.amberAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              height: 140,
                                              width: 140,
                                              child: Center(
                                                child: Text(
                                                  "Select Image",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
