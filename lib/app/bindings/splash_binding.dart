import 'package:get/get.dart';
import 'package:truyen/app/controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}