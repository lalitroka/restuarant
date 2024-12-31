import 'dart:convert';

import 'package:foodmenu/model/menu_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<MenuModel>?> fetchMenu() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/790dd4b1-65db-4dfc-8b32-d34ba9480c5f'));

    if (response.statusCode == 200) {
      final jsondeCodeValue = jsonDecode(response.body);
      List menuList = jsondeCodeValue['menu'];
      List<MenuModel> menuDataList = menuList
          .map(
            (e) => MenuModel.fromJson(e),
          )
          .toList();
      return menuDataList;
    } else {
      throw Exception('Failed to load Menu Data');
    }
  }
}
