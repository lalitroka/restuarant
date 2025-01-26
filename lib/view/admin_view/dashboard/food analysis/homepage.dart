import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_color.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _heightAnimation;
  OverlayEntry? _overlayEntry;


  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: Duration(microseconds: 0),

    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationcontroller,
      curve: Curves.ease,
    );

     _heightAnimation = Tween<double>(begin: 10, end: 150).animate(
    CurvedAnimation(
        parent: _animationcontroller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }


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
    FlSpot(1, 60),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.cardcolor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 2,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        shape: BoxShape.circle),
                                  ),
                                  Text("Total Orders",
                                      style: AppTextStyles.titleSmall),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('1233', style: AppTextStyles.titlemedium),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColor.cardcolor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 2,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle),
                                  ),
                                  Text("Total Amount",
                                      style: AppTextStyles.titleSmall),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('Rs. 800033',
                                  style: AppTextStyles.titlemedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(selectFilter, style: AppTextStyles.titleSmall),
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
                                  child: Text('Today',
                                      style: AppTextStyles.titleSmall),
                                ),
                                PopupMenuItem(
                                  value: 'Weekly',
                                  child: Text('Weekly',
                                      style: AppTextStyles.titleSmall),
                                ),
                                PopupMenuItem(
                                  value: 'Monthly',
                                  child: Text('Monthly',
                                      style: AppTextStyles.titleSmall),
                                ),
                              ];
                            }),
                      ],
                    ),
                    SizedBox(
                      height:20,
                    ),
                    SizedBox(
                      width: screenWidth * 0.93,
                      height: screenHeight * 0.4,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(
                            drawVerticalLine: true,
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
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
                          minY: getFilteredData().length.toDouble(),
                          maxY: 90,
                          barGroups: List.generate(
                            getFilteredData().length,
                            (index) {
                              final spot = getFilteredData()[index];
                              return BarChartGroupData(
                                x: spot.x.toInt(),
                                barRods: [
                                  BarChartRodData(
                                    toY: spot.y,
                                    width: 8,
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text('4.1% than yesterday',
                            style: AppTextStyles.headlineLarge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
     floatingActionButton: SizedBox(
      height: 70,
      width: 70,
       child: FloatingActionButton(
        onPressed: _showPopup,
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add, size: 40),
           ),
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }


  void _showPopup() {
    if (_overlayEntry != null) return;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            _closePopup();
          },
          behavior: HitTestBehavior.translucent, 
          child: Stack(
      children: [
        Positioned(
          bottom: 110,
          right: 0,
          child: GestureDetector(
            onTap: _showPopup,
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: Alignment.bottomRight,
              child: Material(
                color: Colors.transparent,
                child: AnimatedBuilder(
                  animation: _heightAnimation,
                  builder: (context, child) {
                    return Container(
                      height: _heightAnimation.value,
                      width: 200,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _popupOption("Food Analytics", Icons.analytics, () {
                               _closePopup();
                              Navigator.pushNamed(context, '/admincategoryanalysis');
                              _closePopup();
                            }),
                            _popupOption("Add Category", Icons.category, () {
                              _closePopup();
                              Navigator.pushNamed(context, '/admincategoryaddpage');
                           
                            }),
                            _popupOption("Add Item", Icons.food_bank_outlined, () {
                              _closePopup();
                              Navigator.pushNamed(context, '/adminfooditempage');
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    ),
        );
      },
    );

    overlay.insert(_overlayEntry!);
    _animationcontroller.forward(); 
  }

  void _closePopup() {
    _animationcontroller.reverse().whenComplete(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  
  Widget _popupOption(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 25,),
            const SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
