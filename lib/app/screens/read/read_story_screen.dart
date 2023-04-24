import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:truyen/app/controllers/read_story_controller.dart';

import 'component/setting_theme.dart';

class ChapterScreen extends GetView<ReadStoryController> {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color getForegroundOnBackground(Color backgroundColor) {
      double luminance = backgroundColor.computeLuminance();
      return luminance > 0.5 ? Colors.black : Colors.white;
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showMenu();
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: Get.height,
                        ),
                        color: controller.backgroundColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.arguData[0]['chapter_name'],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: getForegroundOnBackground(
                                        controller.backgroundColor),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  DateFormat('HH:mm')
                                      .format(controller.date.value)
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: getForegroundOnBackground(
                                        controller.backgroundColor),
                                  ),
                                ),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: getForegroundOnBackground(
                                        controller.backgroundColor),
                                  ),
                                ),
                                Text(
                                  '${controller.batteryLvl.value}%',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: getForegroundOnBackground(
                                        controller.backgroundColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.arguData[0]['chapter_name']
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: controller.theme.value,
                                  fontSize: 25,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Obx(() => controller.isContentLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : controller.isScrollHori.value
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          controller.chapterData.value,
                                          style: TextStyle(
                                            fontFamily: controller.theme.value,
                                            fontSize: controller.textSize.value,
                                            color: getForegroundOnBackground(
                                              controller.backgroundColor,
                                            ),
                                          ),
                                        ))
                                    : SizedBox(
                                        height: Get.height,
                                        width: Get.width,
                                        child: controller.generatePages(
                                            controller.chapterData.value))),
                            const SizedBox(
                              height: 30,
                            ),
                            // Container(
                            //   width: Get.width,
                            //   alignment: Alignment.center,
                            //   child: const Text(
                            //     '------oOo------',
                            //     style: TextStyle(
                            //         color: Colors.green, fontFamily: 'Bruno'),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  controller.isHide.value
                      ? const SizedBox.shrink()
                      : Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: controller.backgroundColor,
                              border: Border(
                                bottom: BorderSide(
                                  color: getForegroundOnBackground(
                                      controller.backgroundColor),
                                  width: 0.1,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: getForegroundOnBackground(
                                                controller.backgroundColor),
                                          ),
                                        ),
                                        Icon(
                                          Icons.menu,
                                          color: getForegroundOnBackground(
                                              controller.backgroundColor),
                                        ),
                                        const Spacer(),
                                        const SettingTheme(),
                                      ],
                                    ),
                                    Text(
                                      controller.arguData[0]['story_name'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.abel(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  controller.isHide.value
                      ? const SizedBox.shrink()
                      : Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: Get.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: controller.backgroundColor,
                              border: Border(
                                top: BorderSide(
                                  color: getForegroundOnBackground(
                                      controller.backgroundColor),
                                  width: 0.1,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.menu,
                                      color: getForegroundOnBackground(
                                        controller.backgroundColor,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.comment_outlined,
                                    color: getForegroundOnBackground(
                                      controller.backgroundColor,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.book_1,
                                    color: getForegroundOnBackground(
                                      controller.backgroundColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.headphones_outlined,
                                    color: getForegroundOnBackground(
                                      controller.backgroundColor,
                                    ),
                                  ),
                                  const SettingTheme(),
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
