import 'package:foodmenu/model/food_order_model.dart';

abstract class FoodOrderEvent {}

class FoodOrderInitialEvent extends FoodOrderEvent {}

class FoodOrderRequestEvent extends FoodOrderEvent {
  final List<FoodOrderModel> foodRequestItem;

  FoodOrderRequestEvent({required this.foodRequestItem});
}

class FoodOrderCancelEvent extends FoodOrderEvent {
  final int foodCancelItem;

  FoodOrderCancelEvent({required this.foodCancelItem});
}
