import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  int containerCount = 0;
  final Map<int, TextEditingController> nameControllers = {};
  final Map<int, TextEditingController> descriptionControllers = {};

  final List<int> containerKeys = [];

  void _addCategory() {
    setState(() {
      containerKeys.add(containerCount);
      nameControllers[containerCount] = TextEditingController();
      descriptionControllers[containerCount] = TextEditingController();
      containerCount++;
    });
  }

  void _removeCategory(int key) {
    setState(() {
      containerKeys.remove(key);
      nameControllers[key]?.dispose();
      descriptionControllers[key]?.dispose();
      nameControllers.remove(key);
      descriptionControllers.remove(key);
    });
  }

  @override
  void dispose() {
    for (var controller in nameControllers.values) {
      controller.dispose();
    }
    for (var controller in descriptionControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: SingleChildScrollView(
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
                            'Category List',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                        builder: (context, state) {
                          if (state is FoodCategoryAddState) {
                            final insertedData = state.categoryModel;
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: insertedData.length,
                              itemBuilder: (context, index) {
                                final category = insertedData[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  color: Colors.black,
                                  child: Row(
                                    children: [
                                      BlocBuilder<ImageaddBloc, ImageaddState>(
                                        builder: (context, imageState) {
                                          if (imageState is FoodImageAddState) {
                                            final imageUrl =
                                                imageState.imageModel;
                                            if (imageUrl.isNotEmpty) {
                                              return Builder(
                                                  builder: (context) {
                                                return SizedBox(
                                                  height: 130,
                                                  width: 130,
                                                  child: ListView.builder(
                                                    itemCount: imageUrl.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      final imagePath =
                                                          imageUrl[index];
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 8.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                        child: Image.file(
                                                          File(imagePath
                                                              .imageUrl),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              });
                                            }
                                          }
                                          return GestureDetector(
                                            onTap: () async {
                                              final picker = ImagePicker();
                                              final pickedFile =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (pickedFile != null) {
                                                final imagePath =
                                                    pickedFile.path;
                                                ImageModel imageModel =
                                                    ImageModel(
                                                  id: UniqueKey().hashCode,
                                                  imageUrl: imagePath,
                                                );
                                                // ignore: use_build_context_synchronously
                                                context
                                                    .read<ImageaddBloc>()
                                                    .add(FoodImageAddEvent(
                                                        imageModel: [
                                                          imageModel
                                                        ]));
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.amberAccent,
                                              ),
                                              height: 140,
                                              width: 140,
                                              child: const Center(
                                                child: Text(
                                                  "Select Image",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          category.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.linear_scale,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.expand_more,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      ...containerKeys.map((key) => reBuildContainer(key)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: _addCategory,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            color: Colors.black,
                            child: Text(
                              'Add Category',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget reBuildContainer(int key) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        children: [
          TextField(
            controller: nameControllers[key],
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              labelText: 'Category Name',
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _removeCategory(key),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (nameControllers[key]?.text.isNotEmpty ?? false) {
                    final category = CategoryModel(
                      id: key,
                      name: nameControllers[key]?.text ?? '',
                      description: descriptionControllers[key]?.text ?? '',
                    );
                    context
                        .read<FoodCategoryBloc>()
                        .add(FoodCategoryAddEvent(categoryModel: [category]));
                    _removeCategory(key);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
