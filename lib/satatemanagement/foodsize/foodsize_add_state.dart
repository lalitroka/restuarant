part of 'foodsize_add_bloc.dart';

abstract class FoodSizeAddState {}

class FoodSizeAddInitial extends FoodSizeAddState {}

class FoodItemSizeAddState extends FoodSizeAddState {
  final List<FoodSizeModel> foodSizeModel;

  FoodItemSizeAddState({required this.foodSizeModel});
}
