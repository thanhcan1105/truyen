import 'package:get/get.dart';
import 'package:truyen/app/controllers/chapter_view_controller.dart';

class ChapterViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChapterViewController());
  }
}
