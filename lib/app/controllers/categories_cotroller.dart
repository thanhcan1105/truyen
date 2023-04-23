import 'package:get/get.dart';

class CategoriesController extends GetxController {
  late String name;

  List<CategoryModel> list = [
    CategoryModel(name: 'Truyện FULL'),
    CategoryModel(name: 'Truyện mới'),
    CategoryModel(name: 'Truyện mới cập nhật'),
    CategoryModel(name: 'Truyện đọc nhiều'),
    CategoryModel(name: 'Chuyển sinh'),
    CategoryModel(name: 'Fantasy'),
    CategoryModel(name: 'Dị năng'),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}

class CategoryModel {
  String name;

  CategoryModel({
    required this.name,
  });
}
