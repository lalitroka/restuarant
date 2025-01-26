import 'package:flutter/material.dart';
import 'package:foodmenu/core/utils/app_text_style.dart';
import 'package:foodmenu/view/commonwidgets/background_painter.dart';

class UserFoodFavoritePage extends StatefulWidget {
  const UserFoodFavoritePage({super.key});

  @override
  State<UserFoodFavoritePage> createState() => _UserFoodFavoritePageState();
}

class _UserFoodFavoritePageState extends State<UserFoodFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SafeArea(child:
        
         Column(
          children: [
            Text('Favorite Food',style: AppTextStyles.displaymedium,),
            Expanded(
              child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 26, 27, 27),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image(
                                      height: 60,
                                      width: 60,
                                      image: AssetImage('assets/fish.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chicken Burger',
                                        style: AppTextStyles.titleSmall,
                                      ),
                                      Text(
                                        'very tasty food',
                                        style: AppTextStyles.titleSmall.copyWith(
                                            fontSize: 15, color: Colors.white70),
                                      ),
                                      Text(
                                        '3.54',
                                        style: AppTextStyles.titleSmall,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    size: 30,
                                    Icons.favorite,
                                    color: const Color.fromARGB(255, 145, 116, 116),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        )),
      ),
    );
  }
}