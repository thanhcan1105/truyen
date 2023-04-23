import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: Get.height,
                    //   // color: Colors.blueAccent,
                    //   child: Center(child: CircularProgressIndicator()),
                    // ),
                    Item(
                      widget: Column(
                        children: [
                          CachedNetworkImage(
                              width: Get.width * 0.5,
                              imageUrl:
                                  'https://static.8cache.com/cover/eJzLyTDWL3AurIxIsXR1Dgv0snSqzCrPdS5yyU0rs4go9KoKKHOvTA52M7LI9naxjDArNIx39bUM9jTzy831LXc2zQ4ucHQ2MzP0cjWpMsyx8M8JzS4vLbctNzI01c0wNjICAA4BHvE=/mot-cai-bug-chi-muon-song-sot.jpg'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'MỘT CÁI BUG CHỈ MUỐN SỐNG SÓT' * 2,
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
                            rlable: 'Vũ Tiểu thụ',
                          ),
                          InfoItem(
                            llable: 'Trạng thái',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            function: () {},
                            llable: 'Thể loại',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            llable: 'Số chương',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            llable: 'Ngày đăng',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            llable: 'Ngày cập nhật',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            llable: 'Lượt đọc',
                            rlable: 'Đang ra',
                          ),
                          InfoItem(
                            llable: 'Nguồn',
                            rlable: 'Đang ra',
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
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 3.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      widget: const Text(
                          '[Tác giả Vũ Tiểu Thụ -- Thể loại: Dị giới, Khoa Huyễn, Xuyên không, Hài Hước]'),
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
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...controller.listItem
                        .sublist(controller.listItem.length - 5)
                        .map(
                          (e) => Item(
                            widget: Text(
                              e.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
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
                          style: TextStyle(fontSize: 10, color: Colors.blue),
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
                          Get.toNamed('chapter');
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
        children: [
          Text('$llable: '),
          GestureDetector(
            onTap: function,
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
