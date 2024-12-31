part of 'foodsize_add_bloc.dart';

abstract class FoodSizeAddEvent {}

class FoodItemSizeAddEvent extends FoodSizeAddEvent {
  final List<FoodSizeModel> foodSizeModel;

  FoodItemSizeAddEvent({required this.foodSizeModel});
}
