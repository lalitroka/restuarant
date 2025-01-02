part of 'imageadd_bloc.dart';

@immutable
sealed class ImageaddEvent {}

class FoodImageAddEvent extends ImageaddEvent {
  final List<ImageModel> imageModel;

  FoodImageAddEvent({required this.imageModel});
}
