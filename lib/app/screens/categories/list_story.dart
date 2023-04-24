import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:truyen/app/controllers/story_controller.dart';

class ListStory extends GetView<StoryController> {
  ListStory({super.key});

  // StoryController sController = Get.put(StoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            controller.data[0]['cate_name'].toString(),
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
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        ...controller.listStory.map(
                          (element) => GestureDetector(
                            onTap: () {
                              controller.detailStory(element.id);
                              Get.toNamed('story');
                            },
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 100),
                              margin: const EdgeInsets.only(bottom: 10),
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
                                        imageUrl: element.poster.toString(),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          element.title.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(element.author.toString()),
                                        Row(
                                          children: [
                                            // Text(element.chapters!.length
                                            //     .toString()),
                                            const Text('Chapter'),
                                            const Text(' - '),
                                            Text(element.status.toString())
                                          ],
                                        ),
                                        Text(
                                          DateFormat('dd-MM-yyyy HH:mm:ss')
                                              .format(
                                            DateTime.parse(
                                              element.uploadDate.toString(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ));
  }
}
