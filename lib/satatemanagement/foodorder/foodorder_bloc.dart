import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/food_order_model.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_event.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_state.dart';

class FoodOrderBloc extends Bloc<FoodOrderEvent, FoodOrderState> {
  final List<FoodOrderModel> orderList = [];

  FoodOrderBloc() : super(FoodOrderInitialState()) {
    on<FoodOrderRequestEvent>(_foodOrderRequestEvent);
    on<FoodOrderCancelEvent>(_foodOrderCancelEvent);
  }

  void _foodOrderRequestEvent(
      FoodOrderRequestEvent event, Emitter<FoodOrderState> emit) {
    for (var foodItem in event.foodRequestItem) {
      final existingIndex =
          orderList.indexWhere((item) => item.id == foodItem.id);
      if (existingIndex != -1) {
        orderList[existingIndex] = foodItem;
      } else {
        orderList.add(foodItem);
      }
    }

    emit(FoodOrderUpdateState(orderList: List.from(orderList)));
  }

  void _foodOrderCancelEvent(
      FoodOrderCancelEvent event, Emitter<FoodOrderState> emit) {
    orderList.removeWhere((item) => item.id == event.foodCancelItem);

    emit(FoodOrderUpdateState(orderList: List.from(orderList)));
  }
}
