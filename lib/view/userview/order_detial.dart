import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

import '../../satatemanagement/foodorder/foodorder_state.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    SizedBox(width: screenWidth * 0.18),
                    Text(
                      'Order Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<FoodOrderBloc, FoodOrderState>(
                    builder: (context, state) {
                      if (state is FoodOrderUpdateState) {
                        final selectedFoods = state.orderList;

                        if (selectedFoods.isEmpty) {
                          return Center(
                            child: Text(
                              "No orders found",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: selectedFoods.length,
                          itemBuilder: (context, orderIndex) {
                            final food = selectedFoods[orderIndex];
                            final totalFoodPrice = food.foodPrice *
                                food.foodQuantity *
                                food.numberOfPeople;

                            return Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 5,
                              ),
                              child: ListTile(
                                title: Text('Food Name: ${food.foodName}'),
                                subtitle: Column(
                                  spacing: 3,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Quantity: ${food.foodQuantity} kg'),
                                    Text(
                                        'Price Per kg: \$${food.foodPrice.toStringAsFixed(2)}'),
                                    Text(
                                        'Number of People: ${food.numberOfPeople}'),
                                    Text(
                                        'Total: \$${totalFoodPrice.toStringAsFixed(2)}'),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return Center(
                        child: Text(
                          "No orders found",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<FoodOrderBloc, FoodOrderState>(
                    builder: (context, state) {
                      if (state is FoodOrderUpdateState) {
                        final selectedFoods = state.orderList;

                        if (selectedFoods.isNotEmpty) {
                          final totalOrderPrice = selectedFoods.fold<double>(
                            0.0,
                            (previousValue, food) =>
                                previousValue +
                                (food.foodPrice *
                                    food.foodQuantity *
                                    food.numberOfPeople),
                          );

                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' \$${totalOrderPrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  ' finalized order',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }

                      return Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      );
                    },
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
