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

class ImageModel {
  final int id;
  final String imageUrl;

  ImageModel({required this.id, required this.imageUrl});
}

class FoodItemModel {
  final int id;
  final String name;
  final double price;
  final List<DescriptionModel> description;
  final List<FoodSizeModel> sizes;

  FoodItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.sizes = const [],
    this.description = const [],
  });
}

class DescriptionModel {
  final int id;
  final String title;
  final String description;
  final String image;

  DescriptionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
}

class FoodSizeModel {
  final int id;
  final String size;
  final double price;

  FoodSizeModel({required this.id, required this.size, required this.price});
}
