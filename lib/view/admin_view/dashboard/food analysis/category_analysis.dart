import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';

import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminCategoryAnalysis extends StatefulWidget {
  const AdminCategoryAnalysis({super.key});

  @override
  State<AdminCategoryAnalysis> createState() => _AdminCategoryAnalysisState();
}

class _AdminCategoryAnalysisState extends State<AdminCategoryAnalysis> {
     String selectFilter = "today";
  String   selectbyOrder = 'high to low';
  List<Map<String, int>> categoryList = [
    {'Indian': 20},
    {'Chinese': 10},
    {'Nepali': 15},
    {'Newari': 5},
    {'Thai': 4},
    {'Japanese': 10},
    {'Tea': 5},
    {'Korean': 8},
    {'Russian': 6},
    {'American': 13},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 70),
                    Text('Category Analysis', style: AppTextStyles.titlelarge),
                  ],
                ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                                Row(
                                  children: [
                                    Text(selectFilter, style: AppTextStyles.titlemedium),
                            
                            PopupMenuButton(
                              color: AppColor.cardcolor,
                                onSelected: (value) {
                                  setState(() {
                                    selectFilter = value;
                                  });
                                },
                                icon: Icon(
                                  Icons.filter_alt_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      value: 'Today',
                                      child: Text(
                                        'Today',
                                        style:AppTextStyles.titleSmall
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'Weekly',
                                      child: Text(
                                        'Weekly',
                                        style: AppTextStyles.titleSmall
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'Monthly',
                                      child: Text(
                                        'Monthly',
                                        style: AppTextStyles.titleSmall
                                      ),
                                    ),
                                  ];
                                }),
                                      ],
                                ),
                       Row(
                          children: [
                            Text(
                               selectbyOrder,
                              style: AppTextStyles.titleSmall
                            ),
                            PopupMenuButton(
                              color: AppColor.cardcolor,
                                onSelected: (value) {
                                  setState(() {
                                    selectbyOrder = value;
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      value: 'low to high',
                                      child: Text(
                                        'Low to High',
                                        style:AppTextStyles.titleSmall,
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'high to low',
                                      child: Text(
                                        'High to Low',style:AppTextStyles.titleSmall,
                                      ),
                                    )
                                  ];
                                })
                          ],
                        ),
                     ],
                   ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    hintText: 'Search food category...',
                    hintStyle: const TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {}); 
                  },
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final categoryName = categoryList[index].keys.first;
                      final percentage = categoryList[index].values.first;

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/adminfoodrevenue');
                        },
                        child: Container(
                          
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: [
                             
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.cardcolor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: AppColor.cardboxShadow,
                                ),
                              ),
                            
                              FractionallySizedBox(
                                widthFactor: percentage / 100,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            
                              Positioned.fill(
                                right: 5,
                                left: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(categoryName,
                                        style: AppTextStyles.titleSmall),
                                    Text('$percentage%',
                                        style: AppTextStyles.titleSmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
