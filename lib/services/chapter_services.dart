import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constance.dart';

class ChapterServiecs {
  Future getListChapter(slug) async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/story/$slug/chapters'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future readStory(slug) async {
    final res = await http.get(
      Uri.parse('${CONST.API_BASE_URL}/chapter/$slug'),
    );
    var bodyResponse = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return bodyResponse;
    } else {
      return null;
    }
  }
}
