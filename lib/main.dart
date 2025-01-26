import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmenu/core/routes/app_routes.dart';
import 'package:foodmenu/satatemanagement/description/description_bloc.dart';
import 'package:foodmenu/satatemanagement/foodcategory/food_category_bloc.dart';
import 'package:foodmenu/satatemanagement/fooditem/food_item_bloc.dart';
import 'package:foodmenu/satatemanagement/foodorder/foodorder_bloc.dart';
import 'package:foodmenu/satatemanagement/foodsize/foodsize_add_bloc.dart';
import 'package:foodmenu/satatemanagement/imageinsert/imageadd_bloc.dart';
void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FoodOrderBloc()),
        BlocProvider(create: (_) => FoodCategoryBloc()),
        BlocProvider(create: (_) => FoodItemBloc()),
        BlocProvider(create: (_) => FoodSizeAddBloc()),
        BlocProvider(create: (_) => DescriptionBloc()),
        BlocProvider(create: (_) => ImageaddBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.userHomePage,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}


