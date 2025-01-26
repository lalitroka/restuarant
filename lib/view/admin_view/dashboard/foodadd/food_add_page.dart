import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:foodmenu/model/foodaddmodel.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AdminFoodItemAddPage extends StatefulWidget {
  const AdminFoodItemAddPage({super.key});
  @override
  State<AdminFoodItemAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<AdminFoodItemAddPage> {
  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final Map<int, TextEditingController> _sizeController = {};
  final Map<int, TextEditingController> _subPriceController = {};

  int foodSizeCount = 0;
  final List<int> foodSizeKeys = [];

  void _addFoodSize() {
    setState(() {
      foodSizeKeys.add(foodSizeCount);
      _sizeController[foodSizeCount] = TextEditingController();
      _subPriceController[foodSizeCount] = TextEditingController();
      foodSizeCount++;
    });
  }

  void _removeFoodSize(int sizeKey) {
    setState(() {
      foodSizeKeys.remove(sizeKey);
      _sizeController[sizeKey]?.dispose();
      _subPriceController[sizeKey]?.dispose();
      _sizeController.remove(sizeKey);
      _subPriceController.remove(sizeKey);
    });
  }

  @override
  void initState() {
    super.initState();
    activeController = titleController;
    titleFocusNode.addListener(() {
      if (titleFocusNode.hasFocus) {
        setState(() {
          activeController = titleController;
        });
      }
    });

    _foodNameController.addListener(() {
      setState(() {
        final document = Document.fromJson([
          {"insert": "${_foodNameController.text}\n"}
        ]);
        titleController = QuillController(
          document: document,
          selection:
              TextSelection.collapsed(offset: _foodNameController.text.length),
        );
      });
    });

    descriptionFocusNode.addListener(() {
      if (descriptionFocusNode.hasFocus) {
        setState(() {
          activeController = descriptionController;
        });
      }
    });
    _resetForm();
  }

  void _resetForm() {
    setState(() {
      _foodNameController.clear();
      _priceController.clear();
      foodSizeKeys.clear();
      _sizeController.clear();
      _subPriceController.clear();
      foodSizeCount = 0;
    });
  }

  // description
  bool isDescriptionExpanded = false;
  QuillController titleController = QuillController.basic();
  final QuillController descriptionController = QuillController.basic();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  QuillController? activeController;
//
  File? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                Positioned.fill(
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: _foodNameController,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: 'Food Name',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: _priceController,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Price',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: '0',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          ...foodSizeKeys.map((key) => _addSizeContainer(key)),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => _addFoodSize(),
                                child: const Text(
                                  'Add Size',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDescriptionExpanded =
                                        !isDescriptionExpanded;
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                        // color: Colors.blueGrey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Add Description',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _resetForm();
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (_foodNameController.text.isNotEmpty &
                                        _priceController.text.isNotEmpty) {
                                      final foodItemData = FoodItemModel(
                                        id: 1,
                                        name: _foodNameController.text,
                                        price: double.parse(
                                            _priceController.text.trim()),
                                      );

                                      context.read<FoodItemBloc>().add(
                                          FoodItemAddEvent(
                                              foodItem: [foodItemData]));
                                      // log(' foodData ${_foodNameController.text} ${_priceController.text}');
                                    }
                                    Future.delayed(Duration(milliseconds: 200),
                                        _resetForm);
                                  },
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (isDescriptionExpanded)
                  _descriptionContiner(context, screenWidth)
              ])),
          ),
        ));
  }

  Container _descriptionContiner(BuildContext context, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Positioned(
        top: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isDescriptionExpanded = !isDescriptionExpanded;
                    });
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red, fontSize: 19),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      final titleJson = jsonEncode(
                          titleController.document.toDelta().toJson());
                      final descriptionJson = jsonEncode(
                          descriptionController.document.toDelta().toJson());
                      final imageUrl = image?.path ?? "";
                      if (titleJson.isNotEmpty && descriptionJson.isNotEmpty) {
                        final data = DescriptionModel(
                          id: 1,
                          title: titleJson,
                          description: descriptionJson,
                          image: imageUrl,
                        );
                        context.read<DescriptionBloc>().add(
                              FoodItemDescriptionEvent(
                                  descriptionModel: [data]),
                            );

                        log('Saved: $titleJson && $descriptionJson && $imageUrl');
                        // titleController.clear();
                        // descriptionController.clear();
                        if (mounted) {
                          setState(() {
                            isDescriptionExpanded = !isDescriptionExpanded;
                          });
                        }
                      } else {
                        log('Title and description must be filled.');
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Title',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            QuillEditor.basic(
              controller: titleController,
              focusNode: titleFocusNode,
              configurations: const QuillEditorConfigurations(
                placeholder: 'Enter the title',
                maxContentWidth: 360,
                textSelectionThemeData: TextSelectionThemeData(
                  cursorColor: Colors.black,
                ),
                customStyles: DefaultStyles(
                  paragraph: DefaultTextBlockStyle(
                    TextStyle(
                      color: Colors.black,
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
            const SizedBox(height: 20),
            Text(
              'Body',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              flex: 5,
              child: QuillEditor.basic(
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                configurations: const QuillEditorConfigurations(
                  placeholder: 'Enter your description',
                  maxContentWidth: 360,
                  textSelectionThemeData: TextSelectionThemeData(
                    cursorColor: Colors.black,
                  ),
                  customStyles: DefaultStyles(
                    paragraph: DefaultTextBlockStyle(
                      TextStyle(
                        color: Colors.black,
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
            ),
            if (image != null)
              Image.file(
                image as File,
                height: 70,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: pickImage,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Text('Add Image'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: screenWidth,
              color: const Color.fromARGB(255, 168, 183, 192),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    QuillToolbar.simple(
                      controller: activeController ?? titleController,
                      configurations: const QuillSimpleToolbarConfigurations(
                        toolbarSectionSpacing: -11,
                        showFontFamily: true,
                        showFontSize: true,
                        showBoldButton: true,
                        showItalicButton: true,
                        showColorButton: true,
                        showDirection: false,
                        showSmallButton: false,
                        showUnderLineButton: true,
                        showLineHeightButton: false,
                        showStrikeThrough: false,
                        showInlineCode: false,
                        showBackgroundColorButton: false,
                        showClearFormat: false,
                        showLeftAlignment: false,
                        showCenterAlignment: false,
                        showRightAlignment: false,
                        showJustifyAlignment: false,
                        showHeaderStyle: true,
                        showListNumbers: false,
                        showListBullets: false,
                        showListCheck: false,
                        showCodeBlock: false,
                        showQuote: false,
                        showIndent: false,
                        showLink: false,
                        showUndo: false,
                        showRedo: false,
                        showSearchButton: false,
                        showSubscript: false,
                        showSuperscript: false,
                        showClipboardCut: false,
                        showClipboardCopy: false,
                        showClipboardPaste: false,
                        showDividers: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addSizeContainer(int sizekey) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        spacing: 1,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: _sizeController[sizekey],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                labelText: 'Size',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: TextField(
              controller: _subPriceController[sizekey],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                if (_sizeController[sizekey]!.text.isNotEmpty &&
                    _subPriceController[sizekey]!.text.isNotEmpty) {
                  final sizeData = FoodSizeModel(
                    id: sizekey,
                    size: _sizeController[sizekey]!.text,
                    price: double.parse(_subPriceController[sizekey]!.text),
                  );
                  context
                      .read<FoodSizeAddBloc>()
                      .add(FoodItemSizeAddEvent(foodSizeModel: [sizeData]));
      
                  // log('SizeData ${_sizeController[sizekey]!.text} & ${double.parse(_subPriceController[sizekey]!.text)}');
                }
              },
              child: Icon(
                Icons.check,
                size: 30,
              )),
          TextButton(
              onPressed: () {
                _removeFoodSize(sizekey);
              },
              child: Icon(Icons.delete))
        ],
      ),
    );
  }
}
