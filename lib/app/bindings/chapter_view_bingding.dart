import 'package:get/get.dart';
import 'package:truyen/app/controllers/read_story_controller.dart';

class ChapterViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReadStoryController());
  }
}
