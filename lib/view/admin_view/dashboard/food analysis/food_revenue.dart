import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminFoodRevenuePage extends StatefulWidget {
  const AdminFoodRevenuePage({super.key});

  @override
  State<AdminFoodRevenuePage> createState() => _AdminFoodRevenuePageState();
}

class _AdminFoodRevenuePageState extends State<AdminFoodRevenuePage> {
  List<Map<String, dynamic>> categoryList = [
    {'type': 'Veg MOMO', 'revenue': '4', 'amount': '6000'},
    {'type': 'Buff MOMO', 'revenue': '6', 'amount': '8000'},
       
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
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                Text('Food Revenue',
                    style: AppTextStyles.titlelarge
                        .copyWith(color: Colors.yellow)),
                Text(' MOMO', style: AppTextStyles.titlelarge),
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final String foodName = categoryList[index].values.elementAt(0);
                      final revenue = categoryList[index].values.elementAt(1);
                      final amount = categoryList[index].values.elementAt(2);                 return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.cardcolor),
                      child: Column(
                        spacing: 5,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Food Type', style: AppTextStyles.titlemedium),
                              Text(foodName,
                                  style: AppTextStyles.titlemedium
                                      .copyWith(color: Colors.lightGreen)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Part of Revenue',
                                  style: AppTextStyles.titlemedium),
                              Text(' $revenue%',
                                  style: AppTextStyles.titlemedium
                                      .copyWith(color: Colors.lightGreen)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ammount', style: AppTextStyles.titlemedium),
                              Text('$amount',
                                  style: AppTextStyles.titlemedium
                                      .copyWith(color: Colors.lightGreen)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total revenue', style: AppTextStyles.titlelarge),
                    Text('10%',
                        style: AppTextStyles.titlemedium
                            .copyWith(color: Colors.lightGreen)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Ammount', style: AppTextStyles.titlelarge),
                    Text(
                      '14000',
                    style: AppTextStyles.titlelarge.copyWith(color: Colors.green)
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/adminsinglefoodpraghpage');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                        border: Border.all(color: Colors.yellow, width: 1)),
                    child:
                        Text('View in graph', style: AppTextStyles.buttonText),
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
