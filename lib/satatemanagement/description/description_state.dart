part of 'description_bloc.dart';

abstract class DescriptionState {}

final class DescriptionInitial extends DescriptionState {}

class FoodItemDescriptionState extends DescriptionState {
  final List<DescriptionModel> descriptionModel;

  FoodItemDescriptionState({required this.descriptionModel});
}
