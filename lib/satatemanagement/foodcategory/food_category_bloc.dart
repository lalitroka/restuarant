import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'food_category_event.dart';
part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final List<CategoryModel> categoryModelList = [];

  FoodCategoryBloc() : super(FoodCategoryInitialState()) {
    on<FoodCategoryAddEvent>(_foodCategoryAddEvent);
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
}
