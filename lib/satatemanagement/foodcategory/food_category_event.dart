part of 'food_category_bloc.dart';

abstract class FoodCategoryEvent {}

class FoodCategoryInitalEvent extends FoodCategoryEvent {}

class FoodCategoryAddEvent extends FoodCategoryEvent {
  final List<CategoryModel> categoryModel;

  FoodCategoryAddEvent({required this.categoryModel});
}
