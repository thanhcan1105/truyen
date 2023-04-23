import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/controllers/categories_cotroller.dart';

class DetailCategory extends GetView<CategoriesController> {
  const DetailCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            controller.name,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('story');
                  },
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              width: Get.width * 0.2,
                              imageUrl:
                                  'https://static.8cache.com/cover/eJzLyTDWL3AurIxIsXR1Dgv0snSqzCrPdS5yyU0rs4go9KoKKHOvTA52M7LI9naxjDArNIx39bUM9jTzy831LXc2zQ4ucHQ2MzP0cjWpMsyx8M8JzS4vLbctNzI01c0wNjICAA4BHvE=/mot-cai-bug-chi-muon-song-sot.jpg',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'MỘT CÁI BUG CHỈ MUỐN SỐNG SÓT',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text('Tuyết Nguyên U Linh'),
                              Row(
                                children: const [
                                  Text('Chapter'),
                                  Text(' - '),
                                  Text('Status')
                                ],
                              ),
                              const Text('date'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
