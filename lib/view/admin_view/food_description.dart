import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:foodmenu/model/foodaddmodel.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDescriptionPage extends StatefulWidget {
  const FoodDescriptionPage({super.key});

  @override
  State<FoodDescriptionPage> createState() => _FoodDescriptionPageState();
}

class _FoodDescriptionPageState extends State<FoodDescriptionPage> {
  bool isDescriptionExpanded = false;
  bool isFoodFormOpen = false;
  bool isKeyboardVisible = false;
  final QuillController titleController = QuillController.basic();
  final QuillController descriptionController = QuillController.basic();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  QuillController? activeController;

  void _checkKeyboardVisibility() {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    if (keyboardVisible != isKeyboardVisible) {
      setState(() {
        isKeyboardVisible = keyboardVisible;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeController = titleController;
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      _checkKeyboardVisibility();
    });

    titleFocusNode.addListener(() {
      if (titleFocusNode.hasFocus) {
        setState(() {
          activeController = titleController;
        });
      }
    });

    descriptionFocusNode.addListener(() {
      if (descriptionFocusNode.hasFocus) {
        setState(() {
          activeController = descriptionController;
        });
      }
    });
  }

  List<bool> isCategoryExpand = [];
  final Map<int, TextEditingController> nameitemControllers = {};
  final Map<int, TextEditingController> descriptionitemControllers = {};
  final Map<int, TextEditingController> priceitemControllers = {};
  final Map<int, TextEditingController> sizeitemControllers = {};
  final Map<int, TextEditingController> smallpriceitemControllers = {};

  int itemGenerateKey = 0;
  int foodItemCount = 0;
  int foodSizeCount = 0;
  final List<int> foodSizeKeys = [];
  final List<int> foodItemKeys = [];

  void _addFoodItem() {
    if (itemGenerateKey == 0) {
      setState(() {
        foodItemKeys.add(foodItemCount);
        nameitemControllers[foodItemCount] = TextEditingController();
        descriptionitemControllers[foodItemCount] = TextEditingController();
        priceitemControllers[foodItemCount] = TextEditingController();
        foodItemCount++;
        itemGenerateKey = 1;
      });
    }
  }

  void _addFoodItemSize() {
    setState(() {
      foodSizeKeys.add(foodSizeCount);
      sizeitemControllers[foodSizeCount] = TextEditingController();
      smallpriceitemControllers[foodSizeCount] = TextEditingController();
      foodSizeCount++;
    });
  }

  void _removeFoodItem(int itemKey) {
    setState(() {
      foodItemKeys.remove(itemKey);
      nameitemControllers[itemKey]?.dispose();
      descriptionitemControllers[itemKey]?.dispose();
      priceitemControllers[itemKey]?.dispose();
      nameitemControllers.remove(itemKey);
      descriptionitemControllers.remove(itemKey);
      priceitemControllers.remove(itemKey);
    });
  }

  void _removeFoodItemSize(int sizeKey) {
    setState(() {
      foodSizeKeys.remove(sizeKey);
      sizeitemControllers[sizeKey]?.dispose();
      smallpriceitemControllers[sizeKey]?.dispose();
      sizeitemControllers.remove(sizeKey);
      smallpriceitemControllers.remove(sizeKey);
    });
  }

  @override
  void dispose() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();

    titleController.dispose();
    descriptionController.dispose();

    for (var controller in nameitemControllers.values) {
      controller.dispose();
    }
    for (var controller in descriptionitemControllers.values) {
      controller.dispose();
    }
    for (var controller in priceitemControllers.values) {
      controller.dispose();
    }
    for (var controller in sizeitemControllers.values) {
      controller.dispose();
    }
    for (var controller in smallpriceitemControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: screenHeight,
              child: Stack(children: [
                Positioned.fill(
                    child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Description',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (itemGenerateKey == 1) ...[
                      ...foodItemKeys.map((key) => _addItemsContainer(key)),
                    ],
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => _addFoodItem(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          color: Colors.black,
                          child: const Text(
                            'Add Items',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
                if (isDescriptionExpanded) ...[
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Positioned.fill(
                      bottom: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                final titleJson = jsonEncode(titleController
                                    .document
                                    .toDelta()
                                    .toJson());
                                final descriptionJson = jsonEncode(
                                    descriptionController.document
                                        .toDelta()
                                        .toJson());

                                final data = DescriptionModel(
                                    id: UniqueKey().hashCode,
                                    title: titleJson,
                                    description: descriptionJson);
                                context.read<DescriptionBloc>().add(
                                      FoodItemDescriptionEvent(
                                          descriptionModel: [data]),
                                    );
                                log('descriptionData $titleJson && $descriptionJson');
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
                          Text(
                            'Title',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: QuillEditor.basic(
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
                            flex: 3,
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
                                    controller:
                                        activeController ?? titleController,
                                    configurations:
                                        const QuillSimpleToolbarConfigurations(
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
                          if (!isKeyboardVisible) ...[
                            SizedBox(
                              height: 70,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ]),
            ),
          ),
        ),
      ),
      floatingActionButton: isKeyboardVisible
          ? null
          : SizedBox(
              width: 250,
              child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isDescriptionExpanded = !isDescriptionExpanded;
                    });
                  },
                  isExtended: true,
                  child: isDescriptionExpanded
                      ? Text(
                          'Close Description',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Description',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Icon(Icons.add, size: 30)
                          ],
                        )),
            ),
    );
  }

  Widget _addSizeItemsContainer(
    int sizekey,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        spacing: 1,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: sizeitemControllers[sizekey],
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
              controller: smallpriceitemControllers[sizekey],
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
                if (sizeitemControllers[sizekey]!.text.isNotEmpty &&
                    smallpriceitemControllers[sizekey]!.text.isNotEmpty) {
                  final sizeData = FoodSizeModel(
                    id: sizekey,
                    size: sizeitemControllers[sizekey]!.text,
                    price:
                        double.parse(smallpriceitemControllers[sizekey]!.text),
                  );
                  context
                      .read<FoodSizeAddBloc>()
                      .add(FoodItemSizeAddEvent(foodSizeModel: [sizeData]));

                  log('SizeData ${sizeitemControllers[sizekey]!.text} & ${double.parse(smallpriceitemControllers[sizekey]!.text)}');
                }
              },
              child: Icon(
                Icons.check,
                size: 30,
              )),
          TextButton(
              onPressed: () {
                _removeFoodItemSize(sizekey);
              },
              child: Icon(Icons.delete))
        ],
      ),
    );
  }

  Widget _addItemsContainer(int itemkey) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, top: 5),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nameitemControllers[itemkey],
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
                    controller: priceitemControllers[itemkey],
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
            ...foodSizeKeys.map((key) => _addSizeItemsContainer(key)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _addFoodItemSize(),
                  child: const Text(
                    'Add Size',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _removeFoodItem(itemkey);
                    itemGenerateKey = 0;
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
                    if (nameitemControllers[itemkey]?.text.isNotEmpty ??
                        false) {
                      final foodItemData = FoodItemModel(
                        id: itemkey,
                        name: nameitemControllers[itemkey]?.text ?? '',
                        price: double.parse(
                            priceitemControllers[itemkey]?.text ?? '0.0'),
                      );
                      context
                          .read<FoodItemBloc>()
                          .add(FoodItemAddEvent(foodItem: [foodItemData]));
                    }
                    if (nameitemControllers[itemkey]?.text.isNotEmpty ??
                        false) {
                      _removeFoodItem(itemkey);
                      setState(() {
                        itemGenerateKey = 0;
                      });
                    }

                    log('FoodItemData $itemkey &&&& ${nameitemControllers[itemkey]?.text} & ${double.parse(priceitemControllers[itemkey]!.text)} ');
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
