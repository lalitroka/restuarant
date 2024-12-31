import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'food_category_event.dart';
part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final List<CategoryModel> categoryModelList = [];
  final List<File> selectedImage = [];

  FoodCategoryBloc() : super(FoodCategoryInitialState()) {
    on<FoodCategoryAddEvent>(_foodCategoryAddEvent);
    on<FoodCategoryImageAddEvent>(_foodCategoryImageAddEvent);
  }
  void _foodCategoryAddEvent(
      FoodCategoryAddEvent event, Emitter<FoodCategoryState> emit) {
    for (var categoryFood in event.categoryModel) {
      if (!categoryModelList.any((item) => item.id == categoryFood.id)) {
        categoryModelList.add(categoryFood);
      }
      emit(FoodCategoryAddState(categoryModel: categoryModelList));
    }
  }

  void _foodCategoryImageAddEvent(
      FoodCategoryImageAddEvent event, Emitter<FoodCategoryState> emit) {
    selectedImage.add(event.imageUrl);
    emit(FoodCategoryImageAddState(imageUrl: event.imageUrl));
  }
}
