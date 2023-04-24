import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constance.dart';
import '../model/category_model.dart';

class CategoryServices {
  Future getCategory() async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/category'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<CategoryModel> newsList = List.from(
        bodyResponse.map((element) => CategoryModel.fromJson(element)).toList(),
      );
      return newsList;
    } else {
      return null;
    }
  }
}
