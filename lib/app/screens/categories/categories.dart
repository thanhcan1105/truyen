import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/controllers/categories_cotroller.dart';

import 'list_story.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                childAspectRatio: 3.5,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  ...controller.result.map(
                    (element) => CategoryItem(
                      function: () {
                        // controller.getCategory();
                        Get.toNamed('list_story', arguments: [
                          {'cate_name': element.name},
                          {'cate_slug': element.slug},
                        ]);
                      },
                      name: element.name.toString(),
                    ),
                  )
                ],
              ),
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
