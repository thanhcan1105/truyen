import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReadStoryController extends GetxController {
  RxBool isHide = true.obs;
  RxBool isLoading = false.obs;
  RxInt textSize = 100.obs;
  RxInt numSelected = 1.obs;
  Color backgroundColor = Colors.white;

  var date = DateTime.now().obs;
  late Timer timer;
  // var battery = Battery().obs;
  var battery = Battery().obs;

  String chuoi =
      'Nguyên Sơ đứng trong bóng tối, yên lặng nhìn mọi thứ diễn ra trước mắt.\n“Hoắc Doãn, xin lỗi, tôi không thể trở về cùng anh được.” Cách sơn động mấy chục mét, một người thanh niên chừng hai mươi tuổi nét mặt u buồn nhìn người đàn ông đang ngăn cản dị thú.\n“Quý Minh, tại sao?” Người đàn ông cả người đẫm máu, cổ họng khô khốc tức giận hỏi.\n“Đất nước của chúng ta đã hết hi vọng rồi.” Quý Minh đau buồn nói.\n\n“Lãng phí thời gian tìm cách cứu chữa, còn không bằng tìm con đường khác để đi.”\n“Tìm con đường khác?” Hoắc Doãn dùng hết sức lực của mình, giống như một bức tường đồng vách sắt ngăn chặn trước mặt dị thú, ngăn cản nó tiến lên, “Con đường khác mà anh nói chính là phản bội đất nước của mình?”\n' *
          3;

  final List<Map<String, dynamic>> listFont = [
    {'id': 1, 'name': 'Mặc định', 'style': TextStyle()},
    {'id': 2, 'name': 'Abel', 'style': GoogleFonts.abel()},
    {'id': 3, 'name': 'Syne', 'style': GoogleFonts.syne()},
  ];

  final List<Map<String, dynamic>> listBackground = [
    {'id': 1, 'color': Colors.white},
    {'id': 2, 'color': Colors.orangeAccent},
    {'id': 3, 'color': Colors.purpleAccent},
    {'id': 4, 'color': Colors.grey},
    {'id': 5, 'color': Colors.brown},
  ];

  

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      date.value = DateTime.now();
    });
    // print(Battery().batteryLevel);
    // battery.value.onBatteryStateChanged.listen((BatteryState state) {
    // Do something with new state
// });

    int batteryLevel = await battery.value.batteryLevel;

    battery.value.onBatteryStateChanged.listen((BatteryState state) {
      // Do something with new state
      print(batteryLevel);
    });
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
    print(backgroundColor);
    isLoading.value = false;
  }

  incrementSize() {
    if (textSize.value < 200) {
      textSize.value = textSize.value + 10;
    }
    print(textSize.value);
  }

  decrementSize() {
    if (textSize.value > 50) {
      textSize.value = textSize.value - 10;
    }
    print(textSize.value);
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
}
