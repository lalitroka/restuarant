part of 'imageadd_bloc.dart';

@immutable
sealed class ImageaddState {}

final class ImageaddInitial extends ImageaddState {}

class FoodImageAddState extends ImageaddState {
  final List<ImageModel> imageModel;

  FoodImageAddState({required this.imageModel});
}
