import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/model/graph_model.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      case 'today':
        return spotsToday;
      case 'weekly':
        return spotsWeekly;
      case 'monthly':
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
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(selectFilter, style: AppTextStyles.titlemedium),
                          PopupMenuButton(
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
                                    value: 'today',
                                    child: Text(
                                      'Today',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'weekly',
                                    child: Text(
                                      'Weekly',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'monthly',
                                    child: Text(
                                      'Monthly',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ];
                              }),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/foodanalysis');
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow,
                              border:
                                  Border.all(color: Colors.yellow, width: 1)),
                          child: Text('Food Analysis',
                              style: AppTextStyles.buttonText),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('Overview', style: AppTextStyles.headlineLarge),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth * 0.93,
                    height: screenHeight * 0.6,
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.white, width: 1)
                                ),
                            child: Column(
                              children: [
                                Text('Total Order',
                                    style: AppTextStyles.titleSmall),
                                Text('2277777770',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 2,
                          color: Colors.white,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text('Income', style: AppTextStyles.titleSmall),
                                Text('Rs. 99999999990',
                                    style: AppTextStyles.titleSmall
                                        .copyWith(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('4.1% than yesterday',
                        style: AppTextStyles.headlineLarge),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// 