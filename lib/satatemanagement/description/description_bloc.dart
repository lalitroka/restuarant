import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  List<DescriptionModel> description = [];

  DescriptionBloc() : super(DescriptionInitial()) {
    on<FoodItemDescriptionEvent>(_foodItemDescription);
  }

  void _foodItemDescription(
      FoodItemDescriptionEvent event, Emitter<DescriptionState> emit) {
    for (var fooddescription in event.descriptionModel) {
      log("Received data in BLoC: ${event.descriptionModel}");
      if (!description.any((desc) => desc.id == fooddescription.id)) {
        description.add(fooddescription);
      }
    }
    log("Updated description list: $description");
    emit(FoodItemDescriptionState(descriptionModel: List.from(description)));
  }
}
