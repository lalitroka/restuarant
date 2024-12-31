class CategoryModel {
  final int id;
  final String name;
  final String description;
  final List<FoodItemModel> foodaddItems;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.description,
      this.foodaddItems = const []});
}

class FoodItemModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<FoodSizeModel> sizes;

  FoodItemModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      this.sizes = const []});
}

class FoodSizeModel {
  final int id;
  final String size;
  final double price;

  FoodSizeModel({required this.id, required this.size, required this.price});
}
