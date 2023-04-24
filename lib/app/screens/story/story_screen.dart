import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:truyen/app/controllers/story_controller.dart';
import 'package:truyen/app/screens/story/list_chapter.dart';

class StoryScreen extends GetView<StoryController> {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Item(
                              widget: Column(
                                children: [
                                  CachedNetworkImage(
                                    width: Get.width * 0.5,
                                    imageUrl: controller
                                        .storyDetail.first.poster
                                        .toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.storyDetail.first.title
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Item(
                              widget: Column(
                                children: [
                                  InfoItem(
                                    function: () {},
                                    llable: 'Tác giả',
                                    rlable: controller.storyDetail.first.author
                                        .toString(),
                                  ),
                                  InfoItem(
                                    llable: 'Trạng thái',
                                    rlable:
                                        '${controller.storyDetail.first.status}',
                                  ),
                                  InfoItem(
                                    function: () {},
                                    llable: 'Thể loại',
                                    rlable:
                                        '${controller.storyDetail.first.categoryList}',
                                  ),
                                  InfoItem(
                                    llable: 'Số chương',
                                    rlable: 'nah',
                                    // ${controller.storyDetail.first.chapters!.length}
                                  ),
                                  InfoItem(
                                    llable: 'Ngày đăng',
                                    rlable: DateFormat('dd-MM-yyyy HH:mm')
                                        .format(DateTime.parse(controller
                                            .storyDetail.first.uploadDate
                                            .toString())),
                                  ),
                                  InfoItem(
                                    llable: 'Ngày cập nhật',
                                    rlable: DateFormat('dd-MM-yyyy HH:mm')
                                        .format(DateTime.parse(controller
                                            .storyDetail.first.updatedDate
                                            .toString())),
                                  ),
                                  InfoItem(
                                    llable: 'Lượt đọc',
                                    rlable: '',
                                  ),
                                  InfoItem(
                                    llable: 'Nguồn',
                                    rlable: '',
                                  ),
                                ],
                              ),
                            ),
                            // Rating
                            const Text(
                              'Nhấn vào ngôi sao để chọn số lượng sao đánh giá',
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  onRatingUpdate: (rating) {
                                  },
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.blue,
                                  child: const Text(
                                    'Gửi',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Action
                            Item(
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: const [
                                      Icon(Icons.comment_outlined),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Bình luận (0)',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Icon(Iconsax.heart),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Đánh giá (0)',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Icon(Iconsax.like_1),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Đề cử (0)',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Icon(Iconsax.flag),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Báo cáo',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Infomation
                            Item(
                              widget: Text(
                                  '[Tác giả ${controller.storyDetail.first.author} -- Thể loại: ${controller.storyDetail.first.categoryList}]'),
                            ),
                            //Newest chapter
                            Row(
                              children: [
                                const Text(
                                  'Các số mới nhất',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const ListChapter());
                                  },
                                  child: const Text(
                                    'Xem toàn bộ',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // ...controller.listChapter
                            //     .sublist(controller.listChapter.length - 5)
                            //     .map(
                            //       (e) => Item(
                            //         widget: Text(
                            //           e.header.toString(),
                            //           maxLines: 1,
                            //           overflow: TextOverflow.ellipsis,
                            //         ),
                            //       ),
                            //     ),
                            //Newest comment
                            Row(
                              children: const [
                                Text(
                                  'Các bình luận mới nhất',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Xem toàn bộ',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 45,
                          color: Colors.blue,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Get.toNamed('chapter');
                          controller.getChapterByStory();
                        },
                        color: Colors.blue,
                        minWidth: Get.width * 0.5,
                        height: 50,
                        child: const Text(
                          'Đọc Truyện',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.download,
                        size: 45,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    required this.widget,
    super.key,
  });

  Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[200],
      ),
      child: widget,
    );
  }
}

class InfoItem extends StatelessWidget {
  InfoItem({
    this.function,
    required this.llable,
    required this.rlable,
    super.key,
  });

  String llable;
  String rlable;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$llable: '),
          Expanded(
            child: Text(
              rlable,
              style: TextStyle(
                color: function == null ? Colors.black : Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
