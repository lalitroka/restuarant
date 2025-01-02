import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'food_item_event.dart';
part 'food_item_state.dart';

class FoodItemBloc extends Bloc<FoodItemEvent, FoodItemState> {
  List<FoodItemModel> categoryFoodItems = [];
  FoodItemBloc() : super(FoodItemInitial()) {
    on<FoodItemAddEvent>(_foodItemAddEvent);
  }

  void _foodItemAddEvent(FoodItemAddEvent event, Emitter<FoodItemState> emit) {
    for (var foodItem in event.foodItem) {
      if (!categoryFoodItems.any((item) => item.id == foodItem.id)) {
        categoryFoodItems.add(foodItem);
      }
    }
    emit(FoodItemAddState(foodItem: categoryFoodItems));
  }
}
