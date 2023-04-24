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
  RxList<ChapterModel> chapterSort = <ChapterModel>[].obs;

  var data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
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
    var data = listStory.where((element) => element.id == id).first;
    storyDetail.assign(data);
    isLoading.value = false;
  }

  void getChapterByStory() async {
    // isLoading.value = true;
    String slug = 'tam-than-ky';
    var response = await ChapterServiecs().getListChapter(slug);
    // response.removeWhere((key, value) =>
    //     key == "body" ||
    //     key == "uploadDate" ||
    //     key == "deletedAt"); // Sửa lại hàm lọc
    List<ChapterModel> newsListChapter = List.from(
      response.map((element) => ChapterModel.fromJson(element)).toList(),
    );

    listChapter.assignAll(newsListChapter);
    // isLoading.value = false;
  }
}
