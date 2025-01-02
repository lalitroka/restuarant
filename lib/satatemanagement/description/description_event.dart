part of 'description_bloc.dart';

abstract class DescriptionEvent {}

class FoodItemDescriptionEvent extends DescriptionEvent {
  final List<DescriptionModel> descriptionModel;

  FoodItemDescriptionEvent({required this.descriptionModel});
}
