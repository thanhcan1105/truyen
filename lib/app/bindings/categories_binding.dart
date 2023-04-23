import 'package:get/get.dart';
import 'package:truyen/app/controllers/categories_cotroller.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
  }
}
