import 'package:get/get.dart';
import 'package:truyen/app/bindings/categories_binding.dart';
import 'package:truyen/app/bindings/home_binding.dart';
import 'package:truyen/app/bindings/story_binding.dart';
import 'package:truyen/app/screens/categories/detail_category.dart';
import 'package:truyen/app/screens/read/read_story_screen.dart';
import 'package:truyen/app/screens/home/home_screen.dart';
import 'package:truyen/app/screens/splash/splash_screen.dart';
import 'package:truyen/app/screens/story/story_screen.dart';

import '../app/bindings/read_story_bingding.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DETAILCATEGORY,
      page: () => const DetailCategory(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: Routes.STORY,
      page: () => const StoryScreen(),
      binding: StoryBinding(),
    ),
    GetPage(
      name: Routes.CHAPTER,
      page: () => const ChapterScreen(),
      binding: ReadStoryBinding(),
    )
  ];
}
