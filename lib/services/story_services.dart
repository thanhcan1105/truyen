import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constance.dart';

class StoryServiecs {
  Future getListStory(slug) async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/category/$slug/story'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }
}
