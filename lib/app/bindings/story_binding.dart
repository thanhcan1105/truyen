import 'package:get/get.dart';
import 'package:truyen/app/controllers/story_controller.dart';

class StoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StoryController());
  }
}
