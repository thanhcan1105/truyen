import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:truyen/services/chapter_services.dart';
import 'package:html/parser.dart' show parse;

class ReadStoryController extends GetxController {
  RxBool isHide = true.obs;
  RxBool isLoading = false.obs;
  RxBool isContentLoading = false.obs;
  double fontSize = 15;
  RxBool isScrollHori = true.obs;

  var arguData;

  RxString chapterData = ''.obs;

  RxInt numSize = 100.obs;
  RxDouble textSize = (100 / 5).obs;

  RxInt numSelected = 1.obs;
  Color backgroundColor = Colors.white;
  RxString theme = 'Roboto'.obs;

  var date = DateTime.now().obs;
  late Timer timer;
  var battery = Battery().obs;
  RxInt batteryLvl = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    arguData = Get.arguments;
    getChapterData();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      date.value = DateTime.now();
    });
    batteryLvl.value = await battery.value.batteryLevel;
    battery.value.onBatteryStateChanged.listen((BatteryState state) async {
      // Do something with new state
      batteryLvl.value = await battery.value.batteryLevel;
    });
  }

  PageController pageController = PageController();

  Color getForegroundOnBackground(Color backgroundColor) {
    double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  PageView generatePages(text) {
    final double height = Get.height * .5;
    final TextSpan textSpan =
        TextSpan(text: text, style: TextStyle(fontSize: fontSize));
    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);
    final double lineHeight = textPainter.height;
    final int maxLines = height.floor();

    final List<String> paragraphs = _splitTextIntoParagraphs(text, maxLines);
    final List<Widget> pages = paragraphs.map((paragraph) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            paragraph,
            style: TextStyle(
              fontSize: textSize.value,
              fontFamily: theme.toString(),
              color: getForegroundOnBackground(
                backgroundColor,
              ),
            ),
          ),
        ),
      );
    }).toList();

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: pages,
    );
  }

  void netPage() {
    pageController.nextPage(
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.ease);
  }

  final List<Map<String, dynamic>> listBackground = [
    {'id': 1, 'color': Colors.white},
    {'id': 2, 'color': Colors.orangeAccent},
    {'id': 3, 'color': Colors.purpleAccent},
    {'id': 4, 'color': Colors.grey},
    {'id': 5, 'color': Colors.brown},
  ];

  void getChapterData() async {
    isContentLoading.value = true;
    // String data = 'tam-than-ky/chuong-138';
    var response =
        await ChapterServiecs().readStory(arguData[0]['chapter_slug']);
    var data = response.toString().replaceAll(RegExp(r"[\[\]]"), "");
    chapterData.value = parse(data).documentElement!.text;
    chapterData.value.replaceAll('.', '.\\n');

    isContentLoading.value = false;
  }

  showMenu() {
    isLoading.value = true;
    if (isHide.value == true) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      isHide.value = false;
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
      isHide.value = true;
    }
    isLoading.value = false;
  }

  changeBackground(Color color) async {
    isLoading.value = true;
    // await Future.delayed(Duration(seconds: 1), () {
    backgroundColor = color;
    // });
    isLoading.value = false;
  }

  themeChange(String themeData) {
    isLoading.value = true;
    // await Future.delayed(Duration(seconds: 1), () {
    // });
    theme.value = themeData;
    isLoading.value = false;
  }

  incrementSize() {
    if (numSize.value < 200) {
      numSize.value = (numSize.value + 10);
      textSize.value = numSize.value / 5;
    }
  }

  decrementSize() {
    if (numSize.value > 50) {
      numSize.value = numSize.value - 10;
      textSize.value = numSize.value / 5;
    }
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    timer.cancel();
  }

  List<String> _splitTextIntoParagraphs(String text, int maxLinesPerPage) {
    final words = text.split(' ');
    final paragraphs = <String>[];
    var currentParagraph = '';
    var currentLine = 0.0;
    final lineHeight = 1.2 * fontSize;
    for (final word in words) {
      if (currentLine + (lineHeight / fontSize) > maxLinesPerPage) {
        paragraphs.add(currentParagraph.trim());
        currentParagraph = '';
        currentLine = 0.0;
      }
      if (currentParagraph.isNotEmpty) {
        currentParagraph += ' ';
        currentLine += (lineHeight / fontSize);
      }
      currentParagraph += word;
      currentLine += (lineHeight / fontSize);
    }
    if (currentParagraph.isNotEmpty) {
      paragraphs.add(currentParagraph.trim());
    }
    return paragraphs;
  }
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}
