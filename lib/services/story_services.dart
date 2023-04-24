import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constance.dart';
import '../model/story_model.dart';

class StoryServiecs {
  Future getListStory(slug) async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/category/$slug/story'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      List<StoriesModel> newsList = List.from(
        bodyResponse.map((element) => StoriesModel.fromJson(element)).toList(),
      );
      return newsList;
    } else {
      return null;
    }
  }
}
