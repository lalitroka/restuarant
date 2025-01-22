import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/model/menu_model.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class FakeFoodOrderGenerator {
  static final Faker faker = Faker();
  static final Random random = Random();

  static List<String> foodItems = [
    "Margherita Pizza",
    "Cheeseburger",
    "Chicken Biryani",
    "Pepperoni Pizza",
    "Sushi",
    "Pasta Alfredo",
    "Tacos",
    "Caesar Salad",
  ];
  static List<FoodHistoryModel> generateOrders(int count, DateTime startDate) {
    return List.generate(count, (index) {
      return FoodHistoryModel(
        id: index + 1,
        foodName: foodItems[random.nextInt(foodItems.length)],
        foodPrice: faker.randomGenerator.integer(20, min: 5),
        foodQuantity: faker.randomGenerator.integer(3, min: 1),
        orderDate: startDate.subtract(
            Duration(days: faker.randomGenerator.integer(30, min: 0))),
      );
    });
  }

  static Map<String, dynamic> analyzeOrders(List<FoodHistoryModel> orders) {
    int totalOrders = orders.length;
    Map<String, int> foodCount = {};
    for (var order in orders) {
      foodCount[order.foodName] =
          (foodCount[order.foodName] ?? 0) + order.foodQuantity;
    }

    return {"totalOrders": totalOrders, "foodCount": foodCount};
  }

  static Map<String, dynamic> generateTractionHistory() {
    DateTime today = DateTime.now();
    var dailyOrders = generateOrders(50, today);
    var weeklyOrders = generateOrders(300, today.subtract(Duration(days: 7)));
    var monthlyOrders =
        generateOrders(1200, today.subtract(Duration(days: 30)));

    return {
      "today": analyzeOrders(dailyOrders),
      "weekly": analyzeOrders(weeklyOrders),
      "monthly": analyzeOrders(monthlyOrders),
    };
  }
}

class FoodAnalysisPage extends StatefulWidget {
  const FoodAnalysisPage({super.key});

  @override
  State<FoodAnalysisPage> createState() => _FoodAnalysisPageState();
}

class _FoodAnalysisPageState extends State<FoodAnalysisPage> {
  String selectedFilter = "today";
  late Map<String, dynamic> tractionData;
  String showOrderDataBy = 'high to low';
  final TextEditingController _searchController =
      TextEditingController(); // Add the controller

  @override
  void initState() {
    super.initState();
    tractionData = FakeFoodOrderGenerator.generateTractionHistory();
  }

  @override
  Widget build(BuildContext context) {
    var data = tractionData[selectedFilter];
    List<MapEntry<String, int>> sortedFoodOrders =
        data["foodCount"].entries.toList();

    // Filter the list based on the search query
    String query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      sortedFoodOrders = sortedFoodOrders.where((order) {
        return order.key.toLowerCase().contains(query);
      }).toList();
    }

    // Sort the orders
    sortedFoodOrders.sort((a, b) => showOrderDataBy == 'low to high'
        ? a.value.compareTo(b.value)
        : b.value.compareTo(a.value));

    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
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
                    SizedBox(
                      width: 70,
                    ),
                    Text('Food Analysis', style: AppTextStyles.titlelarge),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(selectedFilter, style: AppTextStyles.titlemedium),
                        PopupMenuButton(
                          onSelected: (value) {
                            setState(() {
                              selectedFilter = value;
                            });
                          },
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                  value: 'today', child: Text('Today')),
                              PopupMenuItem(
                                  value: 'weekly', child: Text('Weekly')),
                              PopupMenuItem(
                                  value: 'monthly', child: Text('Monthly')),
                            ];
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          showOrderDataBy,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        PopupMenuButton(
                            onSelected: (value) {
                              setState(() {
                                showOrderDataBy = value;
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
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'high to low',
                                  child: Text(
                                    'High to Low',
                                  ),
                                )
                              ];
                            })
                      ],
                    ),
                  ],
                ),
                TextField(
                  controller: _searchController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    hintText: 'Search for food...',
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
                    itemCount: sortedFoodOrders.length,
                    itemBuilder: (context, index) {
                      String foodName = sortedFoodOrders[index].key;
                      int orders = sortedFoodOrders[index].value;

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/foodrevenue');
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white70),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(foodName, style: AppTextStyles.titleSmall),
                              Text("$orders orders",
                                  style: AppTextStyles.titleSmall),
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
