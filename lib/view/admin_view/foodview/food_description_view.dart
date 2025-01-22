import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class FoodDescriptionView extends StatefulWidget {
  const FoodDescriptionView({super.key});

  @override
  State<FoodDescriptionView> createState() => _FoodDescriptionViewState();
}

class _FoodDescriptionViewState extends State<FoodDescriptionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: CustomPaint(
            painter: BackgroundPainter(),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<DescriptionBloc, DescriptionState>(
                        builder: (BuildContext context, state) {
                          if (state is FoodItemDescriptionState) {
                            final dataState = state.descriptionModel;
                            log("UI render in description page: ${state.descriptionModel}");
                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: dataState.length,
                                itemBuilder: (context, index) {
                                  final foodData = dataState[index];
                                  final titleDocument = Document.fromJson(
                                      jsonDecode(foodData.title));
                                  final descriptionDocument = Document.fromJson(
                                      jsonDecode(foodData.description));
                                  final titleController = QuillController(
                                    document: titleDocument,
                                    selection:
                                        TextSelection.collapsed(offset: 0),
                                  );

                                  final descriptionController = QuillController(
                                    document: descriptionDocument,
                                    selection:
                                        TextSelection.collapsed(offset: 0),
                                  );
                                  return Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: QuillEditor.basic(
                                          controller: titleController,
                                          configurations:
                                              QuillEditorConfigurations(
                                            customStyles: DefaultStyles(
                                              paragraph: DefaultTextBlockStyle(
                                                TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                                HorizontalSpacing(6, 9),
                                                VerticalSpacing(6, 6),
                                                VerticalSpacing(6, 6),
                                                BoxDecoration(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      QuillEditor.basic(
                                        controller: descriptionController,
                                        configurations:
                                            QuillEditorConfigurations(
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
                                      foodData.image.isNotEmpty
                                          ? Image.file(
                                              File(foodData.image),
                                              height: 200,
                                              width: 400,
                                              fit: BoxFit.cover,
                                            )
                                          : SizedBox(),
                                    ],
                                  );
                                });
                          }
                          return SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
