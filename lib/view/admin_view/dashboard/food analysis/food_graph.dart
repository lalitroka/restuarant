import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class AdminSingleFoodGraphPage extends StatefulWidget {
  const AdminSingleFoodGraphPage({super.key});

  @override
  State<AdminSingleFoodGraphPage> createState() => _AdminSingleFoodGraphPageState();
}

class _AdminSingleFoodGraphPageState extends State<AdminSingleFoodGraphPage> {
    List<FlSpot> spotsToday = [
    FlSpot(1, 10),
    FlSpot(2, 20),
    FlSpot(3, 50),
    FlSpot(4, 40),
    FlSpot(5, 20),
    FlSpot(6, 60),
    FlSpot(7, 30),
    FlSpot(8, 30),
    FlSpot(9, 35),
    FlSpot(10, 40),
    FlSpot(11, 50),
    FlSpot(12, 50),
  ];

  List<FlSpot> spotsWeekly = [
    FlSpot(1, 10),
    FlSpot(2, 40),
    FlSpot(3, 60),
    FlSpot(4, 70),
    FlSpot(5, 80),
    FlSpot(6, 30),
    FlSpot(7, 60),
  ];
  List<FlSpot> spotsMonthly = [
    FlSpot(1, 10),
    FlSpot(2, 20),
    FlSpot(3, 50),
    FlSpot(4, 40),
    FlSpot(5, 20),
    FlSpot(6, 20),
    FlSpot(7, 30),
    FlSpot(8, 30),
    FlSpot(9, 85),
    FlSpot(10, 40),
    FlSpot(11, 70),
    FlSpot(12, 50),
  ];

  List<FlSpot> getFilteredData() {
    switch (selectFilter) {
      case 'Today':
        return spotsToday;
      case 'Weekly':
        return spotsWeekly;
      case 'Monthly':
        return spotsMonthly;
      default:
        return spotsToday;
    }
  }

  String selectFilter = "Today";
  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: Colors.white, size: 25,)),

                        
                                   
                                Text('MOMO',style: AppTextStyles.titlemedium,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: screenWidth * 0.93,
                      height: screenHeight * 0.7,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            drawVerticalLine: true,
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: false,
                            )),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: TextStyle(color: Colors.white),
                                );
                              },
                            )),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                interval: 1,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          minX: 1,
                          maxX: getFilteredData().length.toDouble(),
                          minY: 1,
                          maxY: 90,
                          lineBarsData: [
                            LineChartBarData(
                              spots: getFilteredData(),
                              isCurved: true,
                              barWidth: 2,
                              color: Colors.blue,
                              dotData: FlDotData(show: false),
                            ),
                            LineChartBarData(
                              spots: getFilteredData(),
                              isCurved: true,
                              barWidth: 2,
                              color: Colors.blue,
                              dotData: FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Order',
                            style: AppTextStyles.titlemedium),
                        Text('400',
                            style: AppTextStyles.titlelarge
                                .copyWith(color: Colors.grey)),
                      ],
                    ),
                                          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Income', style: AppTextStyles.titlemedium),
                        Text('Rs. 4000',
                            style: AppTextStyles.titlelarge
                                .copyWith(color: Colors.grey)),
                      ],
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