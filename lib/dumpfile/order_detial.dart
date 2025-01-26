import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

import '../satatemanagement/foodorder/foodorder_state.dart';

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
                    Text('Order Details', style: AppTextStyles.displaymedium),
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
                            child: Text("No orders found",
                                style: AppTextStyles.titlemedium),
                          );
                        }

                        return ListView.builder(
                          itemCount: selectedFoods.length,
                          itemBuilder: (context, orderIndex) {
                            final food = selectedFoods[orderIndex];
                            final totalFoodPrice =
                                food.foodPrice * food.foodQuantity;

                            return Card(
                              color: Colors.blueGrey,
                              margin: EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 5,
                              ),
                              child: ListTile(
                                title: Text(
                                  'Food Name: ${food.foodName}',
                                  style: AppTextStyles.titlemedium,
                                ),
                                subtitle: Column(
                                  spacing: 3,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quantity: ${food.foodQuantity} kg',
                                      style: AppTextStyles.titleSmall,
                                    ),
                                    Text(
                                      'Price Per kg: \$${food.foodPrice.toStringAsFixed(2)}',
                                      style: AppTextStyles.titleSmall,
                                    ),
                                    Text(
                                      'Total: \$${totalFoodPrice.toStringAsFixed(2)}',
                                      style: AppTextStyles.titleSmall,
                                    ),
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
                        child: Text("No orders found",
                            style: AppTextStyles.titlemedium),
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
                                (food.foodPrice * food.foodQuantity),
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
                                    style: AppTextStyles.titlelarge,
                                  ),
                                  Text(
                                      ' \$${totalOrderPrice.toStringAsFixed(2)}',
                                      style: AppTextStyles.titlemedium),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/userpaymentpage');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text('Proceed Order',
                                      style: AppTextStyles.buttonText),
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
