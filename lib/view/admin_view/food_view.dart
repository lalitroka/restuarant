import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
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
    bool isExpand = false;
    final screenHeight = MediaQuery.of(context).size.height;

    void _toogleExpand() {
      setState(() {
        isExpand = !isExpand;
      });
    }

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
                                                    return Flexible(
                                                      child: Column(
                                                        children: [
                                                          ConstrainedBox(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxWidth: double
                                                                        .infinity),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                _toogleExpand();
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: FoodNameText(
                                                                        foodName:
                                                                            foodItem.name),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child: FoodPriceText(
                                                                        foodPrice:
                                                                            foodItem.price),
                                                                  ),
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
                                                                      padding: const EdgeInsets
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
                                                                                flex: 2,
                                                                                child: FoodNameText(foodName: sizeData.size),
                                                                              ),
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: FoodPriceText(foodPrice: sizeData.price),
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
                                                          if (isExpand)
                                                            BlocBuilder<
                                                                DescriptionBloc,
                                                                DescriptionState>(
                                                              builder:
                                                                  (BuildContext
                                                                          context,
                                                                      state) {
                                                                if (state
                                                                    is FoodItemDescriptionState) {
                                                                  final dataState =
                                                                      state
                                                                          .descriptionModel;
                                                                  return ListView
                                                                      .builder(
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: dataState
                                                                              .length,
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            final foodData =
                                                                                dataState[index];
                                                                            final titleDocument =
                                                                                Document.fromJson(jsonDecode(foodData.title));
                                                                            final descriptionDocument =
                                                                                Document.fromJson(jsonDecode(foodData.description));
                                                                            final titleController =
                                                                                QuillController(
                                                                              document: titleDocument,
                                                                              selection: TextSelection.collapsed(offset: 0),
                                                                            );

                                                                            final descriptionController =
                                                                                QuillController(
                                                                              document: descriptionDocument,
                                                                              selection: TextSelection.collapsed(offset: 0),
                                                                            );
                                                                            return Column(
                                                                              children: [
                                                                                QuillEditor.basic(
                                                                                  controller: titleController,
                                                                                  configurations: QuillEditorConfigurations(
                                                                                    customStyles: DefaultStyles(
                                                                                      paragraph: DefaultTextBlockStyle(
                                                                                        TextStyle(
                                                                                          color: Colors.white,
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                        HorizontalSpacing(6, 6),
                                                                                        VerticalSpacing(6, 6),
                                                                                        VerticalSpacing(6, 6),
                                                                                        BoxDecoration(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                QuillEditor.basic(
                                                                                  controller: descriptionController,
                                                                                  configurations: QuillEditorConfigurations(
                                                                                    customStyles: DefaultStyles(
                                                                                      paragraph: DefaultTextBlockStyle(
                                                                                        TextStyle(
                                                                                          color: Colors.white,
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                        HorizontalSpacing(6, 6),
                                                                                        VerticalSpacing(6, 6),
                                                                                        VerticalSpacing(6, 6),
                                                                                        BoxDecoration(),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          });
                                                                }
                                                                return SizedBox();
                                                              },
                                                            ),
                                                        ],
                                                      ),
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
