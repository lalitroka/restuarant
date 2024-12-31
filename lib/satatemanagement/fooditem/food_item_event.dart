part of 'food_item_bloc.dart';

abstract class FoodItemEvent {}

class FoodItemInitialEvent extends FoodItemEvent {}

class FoodItemAddEvent extends FoodItemEvent {
  final List<FoodItemModel> foodItem;

  FoodItemAddEvent({required this.foodItem});
}
