import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDescriptionPage extends StatefulWidget {
  const FoodDescriptionPage({super.key});

  @override
  State<FoodDescriptionPage> createState() => _FoodDescriptionPageState();
}

class _FoodDescriptionPageState extends State<FoodDescriptionPage> {
  final QuillController titleController = QuillController.basic();
  final QuillController descriptionController = QuillController.basic();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  QuillController? activeController;

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

    descriptionFocusNode.addListener(() {
      if (descriptionFocusNode.hasFocus) {
        setState(() {
          activeController = descriptionController;
        });
      }
    });
  }

  @override
  void dispose() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Title',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: QuillEditor.basic(
                    controller: titleController,
                    focusNode: titleFocusNode,
                    configurations: const QuillEditorConfigurations(
                      placeholder: 'Enter the title',
                      maxContentWidth: 360,
                      textSelectionThemeData: TextSelectionThemeData(
                        cursorColor: Colors.white,
                      ),
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
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
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
                        cursorColor: Colors.white,
                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
