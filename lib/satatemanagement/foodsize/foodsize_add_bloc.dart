import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'foodsize_add_event.dart';
part 'foodsize_add_state.dart';

class FoodSizeAddBloc extends Bloc<FoodSizeAddEvent, FoodSizeAddState> {
  final List<FoodSizeModel> foodItemSize = [];

  FoodSizeAddBloc() : super(FoodSizeAddInitial()) {
    on<FoodItemSizeAddEvent>(_foodItemSizeAddEvent);
  }
  void _foodItemSizeAddEvent(
      FoodItemSizeAddEvent event, Emitter<FoodSizeAddState> emit) {
    for (var foodSize in event.foodSizeModel) {
      if (!foodItemSize.any((item) => item.id == foodSize.id)) {
        foodItemSize.add(foodSize);
      }
      emit(FoodItemSizeAddState(foodSizeModel: foodItemSize));
    }
  }
}
