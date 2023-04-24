import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/model/chapter_model.dart';
import 'package:truyen/services/chapter_services.dart';
import 'package:truyen/services/story_services.dart';

import '../../model/story_model.dart';

class StoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<StoriesModel> listStory = <StoriesModel>[].obs;

  RxInt idStory = 0.obs;
  RxList<StoriesModel> storyDetail = <StoriesModel>[].obs;
  RxList<ChapterModel> listChapter = <ChapterModel>[].obs;

  var data = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getStory();
    getChapterByStory();
  }

  void getStory() async {
    isLoading.value = true;
    var response = await StoryServiecs().getListStory(data[1]['cate_slug']);
    List<StoriesModel> newsList = List.from(
      response.map((element) => StoriesModel.fromJson(element)).toList(),
    );
    listStory.assignAll(newsList);
    isLoading.value = false;
  }

  void detailStory(id) {
    isLoading.value = true;
    // print(idStory)
    var data = listStory.where((element) => element.id == id).first;
    storyDetail.assign(data);
    isLoading.value = false;
  }

  void getChapterByStory() async {
    String slug = 'tam-than-ky';
    var response = await ChapterServiecs().getListChapter(slug);
    print(response);
    List<ChapterModel> newsListChapter = List.from(
      response.map((element) => ChapterModel.fromJson(element)).toList(),
    );
    // listChapter.assignAll(newsList);
    listChapter.assignAll(newsListChapter);
    print(listChapter.first.header);
  }
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}
