import 'package:get/get.dart';
import 'package:truyen/model/story_model.dart';
import 'package:truyen/services/category_services.dart';

import '../../model/category_model.dart';

class CategoriesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoryModel> result = <CategoryModel>[].obs;

  RxList<StoriesModel> results = <StoriesModel>[].obs;

  late String name;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    isLoading.value = true;
    var response = await CategoryServices().getCategory();
    List<CategoryModel> newsList = List.from(
      response.map((element) => CategoryModel.fromJson(element)).toList(),
    );
    result.assignAll(newsList);
    isLoading.value = false;
  }
}
