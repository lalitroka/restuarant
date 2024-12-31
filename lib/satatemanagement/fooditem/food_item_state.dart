part of 'food_item_bloc.dart';

abstract class FoodItemState {}

class FoodItemInitial extends FoodItemState {}

class FoodItemAddState extends FoodItemState {
  final List<FoodItemModel> foodItem;

  FoodItemAddState({required this.foodItem});
}
