import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/model/foodaddmodel.dart';

part 'imageadd_event.dart';
part 'imageadd_state.dart';

class ImageaddBloc extends Bloc<ImageaddEvent, ImageaddState> {
  final List<ImageModel> selectedImage = [];

  ImageaddBloc() : super(ImageaddInitial()) {
    on<FoodImageAddEvent>(_foodImageAddEvent);
  }

  void _foodImageAddEvent(
      FoodImageAddEvent event, Emitter<ImageaddState> emit) {
    for (var foodImage in event.imageModel) {
      selectedImage.add(foodImage);
    }
    emit(FoodImageAddState(imageModel: selectedImage));
  }
}
