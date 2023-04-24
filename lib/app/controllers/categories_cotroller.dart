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
    result.assignAll(response);
    isLoading.value = false;
  }
}
