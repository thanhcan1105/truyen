import 'package:get/get.dart';

class StoryController extends GetxController {
  List<Item> listItem = [
    Item( id: 1, name: 'Item 1'),
    Item( id: 2, name: 'Item 2'),
    Item( id: 3, name: 'Item 3'),
    Item( id: 4, name: 'Item 4'),
    Item( id: 5, name: 'Item 5'),
    Item( id: 6, name: 'Item 6'),
    Item( id: 7, name: 'Item 7'),
    Item( id: 8, name: 'Item 8'),
    Item( id: 9, name: 'Item 9'),
    Item( id: 10, name: 'Item 10'),
  ];

  // List<String> latestItem = listItem.sublist(listItem.length - 5).toList();

  @override
  void onInit() {
    super.onInit();
  }
}

class Item {
  final int id;
  final String name;

  Item({ required this.id, required this.name});
}
