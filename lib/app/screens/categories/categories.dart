import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/controllers/categories_cotroller.dart';

import 'detail_category.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        childAspectRatio: 3.5,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          ...controller.list.map(
            (e) => CategoryItem(
              function: () {
                Get.toNamed('detail_category');
                controller.name = e.name;
              },
              name: e.name,
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.function,
    required this.name,
    super.key,
  });

  Function() function;
  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 2,
          //     offset: Offset(0.3, 0.3),
          //   )
          // ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
