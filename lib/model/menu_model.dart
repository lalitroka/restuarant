import 'dart:math';

import 'package:faker/faker.dart';
import 'package:foodmenu/model/food_model.dart';

class MenuModel {
  int? id;
  String? foodCategory;
  List<FoodModel>? foodItem;
  String? image;

  MenuModel({this.id, this.foodCategory, this.image, this.foodItem});
  MenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodCategory = json['foodCategory'];
    foodItem = json['items'];
    image = json['decoration_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['foodcategory'] = foodCategory;
    data['items'] = foodItem;
    data['decoration_image'] = image;
    return data;
  }
}

List<MenuModel> generateMenuData(int numCategories, int numFoodItems) {
  final faker = Faker();
  List<MenuModel> menuList = [];

  for (int i = 0; i < numCategories; i++) {
    List<FoodModel> foodItems = [];
    for (int j = 0; j < numFoodItems; j++) {
      foodItems.add(FoodModel(
        id: j,
        foodName: faker.food.dish(),
        foodprice: (Random().nextInt(2) + 5),
      ));
    }
    String imageUrl = "https://picsum.photos/seed/category$i/300/100";
    menuList.add(MenuModel(
      id: i,
      foodCategory: faker.food.cuisine(),
      image: imageUrl,
      foodItem: foodItems,
    ));
  }

  return menuList;
}




















  // SizedBox(
        //   height: screenHeight * 0.7,
        //   child: ListView.separated(
        //     separatorBuilder: (context, index) => SizedBox(
        //       height: 30,
        //     ),
        //     shrinkWrap: true,
        //     itemCount: foodItems.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       final foodData = foodItems[index];
        //       final isImageFirst = index % 2 == 1;
        //       return Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //         child: Row(children: [
        //           if (isImageFirst) ...[
        //             Image(height: 170, image: AssetImage(foodData.image)),
        //             SizedBox(width: 20),
        //           ],
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               _buildContainer(foodData.foodCategory),
        //               for (var food in foodData.foodItem)
        //                 _textBuild(food.foodName),
        //             ],
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               for (var food in foodData.foodItem)
        //                 _textBuild(food.foodprice.toString()),
        //             ],
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           if (!isImageFirst) ...[
        //             Image(height: 170, image: AssetImage(foodData.image)),
        //           ],
        //         ]),
        //       );
        //     },
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Stack(children: [
        //       Positioned(
        //         right: 20,
        //         bottom: 40,
        //         child: UnconstrainedBox(
        //           clipBehavior: Clip.none,
        //           child: Image.asset(
        //             'assets/fish.png',
        //             height: 150,
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         right: 1,
        //         child: Transform.rotate(
        //           angle: 45 * 44 / 180,
        //           child: Image.asset(
        //             'assets/leaf.png',
        //             height: 140,
        //           ),
        //         ),
        //       ),
        //     ])
        //   ],
        // )
