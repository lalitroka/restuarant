part of 'food_category_bloc.dart';

abstract class FoodCategoryState {}

class FoodCategoryInitialState extends FoodCategoryState {}

class FoodCategoryAddState extends FoodCategoryState {
  final List<CategoryModel> categoryModel;

  FoodCategoryAddState({required this.categoryModel});
}
