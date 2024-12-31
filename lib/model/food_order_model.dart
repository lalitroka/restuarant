class FoodOrderModel {
  final int id;
  final String foodName;
  final int foodPrice;
  final int foodQuantity;
  final int numberOfPeople;

  FoodOrderModel(
      {required this.id,
      required this.foodName,
      required this.foodPrice,
      required this.foodQuantity,
      required this.numberOfPeople});

  factory FoodOrderModel.fromMap(Map<String, dynamic> map) {
    return FoodOrderModel(
      id: map['id'],
      foodName: map['foodName'],
      foodPrice: map['foodPrice'],
      foodQuantity: map['foodQuantity'],
      numberOfPeople: map['numberOfPeople'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodQuantity': foodQuantity,
      'numberOfPeople': numberOfPeople,
    };
  }
}
