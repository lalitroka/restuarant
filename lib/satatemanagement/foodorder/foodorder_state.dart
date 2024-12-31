// part 'foodorder_bloc.dart';

import 'package:foodmenu/model/food_order_model.dart';

abstract class FoodOrderState {}

class FoodOrderInitialState extends FoodOrderState {}

class FoodOrderUpdateState extends FoodOrderState {
  final List<FoodOrderModel> orderList;

  FoodOrderUpdateState({required this.orderList});
}
