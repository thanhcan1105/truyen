import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ExampleController extends GetxController {
  RxBool isHide = true.obs;
  RxBool isLoading = false.obs;
  double fontSize = 15;
  RxBool isScrollHori = false.obs;

  RxInt numSize = 100.obs;
  RxDouble textSize = (100 / 5).obs;

  RxInt numSelected = 1.obs;
  Color backgroundColor = Colors.white;
  RxString theme = 'Roboto'.obs;

  var date = DateTime.now().obs;
  late Timer timer;
  var battery = Battery().obs;
  RxInt batteryLvl = 0.obs;

  PageController pageController = PageController();

  final String chuoi = """
Độ ấm từ sau lưng chậm rãi vây quanh, hô hấp nóng bỏng ở bên tai: “Sợ không?”

Hơi thở xa lạ quanh quẩn bên tai khiến người ta lạnh lẽo đến không dám lên tiếng.

Lâm Tử Lạp như cảm giác được người đàn ông hơi khựng lại, sau đó lại vang lên giọng nói của anh: “Bây giờ hối hận vẫn còn kịp.”

Cô căng thẳng siết chặt hai tay, lắc đầu: “Tôi không hối hận…”

Cô đang ở trong thời kỳ xinh đẹp nhất, nhưng…

Một đêm này đau đớn mà dài lâu…

Cuối cùng nửa đêm về sáng người đàn ông đứng dậy đi vào phòng tắm, Lâm Tử Lạp mới kéo thân thể mệt mỏi, mặc đồ ra khỏi phòng.

Dưới lầu khách sạn có người phụ nữ trung niên giới thiệu công việc này cho cô đang đứng đó, thấy Lâm Tử Lạp đi tới, bà ta đưa cho cô một cái túi màu đen: “Đây là tiền thù lao của cô.”

Lâm Tử Lạp gần như không chút do dự nhận lấy, cầm tiền nhanh chóng chạy đi, thậm chí còn không quan tâm sự đau đớn dưới thân, chỉ muốn nhanh chóng đến bệnh viện.

Bầu trời vẫn chưa sáng khiến hành lang rất im lặng, dưới đất trước phòng phẫu thuật để hai cái cáng cứu thương, vì không đóng tiền nên không được đưa vào phòng phẫu thuật.

Lâm Tử Lạp nhìn mà đau lòng không thôi, nức nở nói: “Tôi có tiền, mau cứu mẹ và em trai tôi đi…” Cô nghẹn ngào đưa tiền trong tay cho bác sĩ, bác sĩ nhìn thoáng qua, đưa cho y tá kiểm kê, sau đó mới kêu nhân viên đưa người bị thương vào trong phòng phẫu thuật.

Lâm Tử Lạp không thấy bọn họ đẩy em trai mình vào, vội vàng nhào lên bắt lấy bác sĩ cầu xin: “Còn cả em trai tôi nữa, ông cứu thằng bé đi…”

Bác sĩ thở dài: “Thật ngại quá, em trai cô đã không cứu được nữa rồi…”

“Không cứu được nữa?!

Lời này như tiếng sét động trời giáng mạnh lên đầu Lâm Tử Lạp, khiến trước mắt cô đen lại…

Đau, lồng ngực như bị người ta dùng con dao quấy phá, đau đến run rẩy ngồi cuộn lại dưới đất, tám năm trước, cô mười tuổi, ba ngoại tình vứt bỏ mẹ, đuổi mẹ đang mang thai và cô ra nước ngoài xa lạ.

Sau đó em trai được sinh ra, lúc ba tuổi phát hiện mắc bệnh tự kỷ, vốn cuộc sống đã túng thiếu, bệnh của em trai lại liên tiếp gặp nạn, cô và mẹ đi làm công cho người khác khắp nơi mới có thể sống qua ngày. Nhưng một vụ tai nạn giao thông, ở nước ngoài không có người thân, không có tiền, không ai giúp đỡ, khiến cô cảm nhận được cái gì là cùng đường.

Bị ép đến đường cùng, cô đã bán đi mình cũng không thể cứu em trai về.

Có một sự đau đớn, nó không dữ dội, nhưng lại khiến người ta cảm thấy không dễ chịu, hít thở cũng khó khăn, bầu trời thì xám xịt, nhưng cô phải chấp nhận, còn phải cười mà chấp nhận, vì cô còn mẹ.

Mẹ cần cô.

Sau khi được điều trị, sức khoẻ của mẹ chuyển biết tốt, nhưng khi biết em trai đã chết, bà như sụp đổ đến nơi.

Là Lâm Tử Lạp ôm bà, khóc nói: “Mẹ, mẹ vẫn còn con, cố sống tốt vì con đi.”

Suốt một tháng ở bệnh viện, Trang Kha Nguyệt thường xuyên ngẩn người ngồi bên giường, Lâm Tử Lạp biết bà nhớ em trai. Nếu không phải vì mình, chỉ sợ mẹ đã đi theo em trai rồi, vì phải chăm sóc mẹ, cô bị đuổi học, nhưng vết thương của mẹ đã chuyển biến tốt đẹp.

Cô xách đồ ăn đi vào bệnh viện, đến trước cửa phòng bệnh, khi cô nâng tay vừa định mở cửa, lại nghe thấy giọng nói ở bên trong…

Cô rất quen với nó, cho dù đã cách xa tám năm, cô vẫn nhớ rõ dáng vẻ ông ta ép mẹ ly hôn với mình.

Sau khi đưa bọn họ đến đây, ông ta chưa từng đến nhìn bọn họ một cái, hôm nay lại đột nhiên xuất hiện ở đây là có ý gì?

“Kha Nguyệt, lúc trước bà và bà chủ nhà họ Tông tình như chị em, đã quyết định hôn ước từ nhỏ, theo đạo lý thì hôn ước bà quyết định phải do con gái bà lấy chồng…”

“Lâm Viên Trung, ông có ý gì?!” Thân hình Trang Kha Nguyệt gầy yếu, bất chấp trên người còn có vết thương mà giãy dụa đứng lên muốn đánh ông ta, ông ta còn là người hay sao?

Sắp xếp cho bà và con gái ở lại cái nơi quỷ quái xa lạ này, chưa từng quan tâm sống chết của bọn họ, hôm nay lại muốn con gái bà lập gia đình?

“Cậu cả nhà họ Tông cũng là con trai bạn tốt của bà, trông ưa nhìn, dòng dõi nhà họ Tông bà cũng biết đó, lấy bên đó chỉ có hưởng phúc thôi…” Nói đến phía sau, giọng ông ta nhỏ lại.
  """;

  Color getForegroundOnBackground(Color backgroundColor) {
    double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  var pageHeight = 200.0;
  var pageWidth = 200.0;
  // const text =
  //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed ante at leo vehicula tincidunt. Donec a velit quam. Fusce nec lorem magna. Donec semper eros eu est commodo rutrum. Nulla facilisi. Nullam faucibus eros quis nulla elementum, nec placerat nisi pellentesque. Etiam consectetur pharetra dui, quis maximus metus. Suspendisse in lacinia mauris. In eget velit mauris. Suspendisse potenti. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ultricies sapien vitae nulla tempor efficitur. Maecenas lobortis enim in leo varius, id fringilla massa luctus. Maecenas facilisis erat eget tortor malesuada, ut dictum libero pulvinar. Nam vel nunc ut lorem vestibulum ultrices. Integer a ante odio. Curabitur non tortor non felis consectetur sodales ut in purus. Vivamus vel diam ac nulla dignissim tincidunt. Aenean consequat augue ut libero rhoncus, ac pharetra sapien accumsan. In hac habitasse platea dictumst. Proin bibendum mauris a lacus luctus efficitur. Sed at lectus eu lacus eleifend tincidunt. Sed nec nibh a urna suscipit tempor. Morbi aliquet laoreet purus, nec eleifend magna pretium ac. Nullam bibendum erat id massa congue, eu bibendum sapien tincidunt. Sed maximus purus eu dui tincidunt, at lobortis nisl pellentesque. Sed blandit, nisi eget hendrerit fringilla, massa arcu fermentum metus, quis consectetur est turpis vel velit. Cras nec tristique metus. Etiam mollis mauris nulla, id hendrerit neque interdum nec. Sed varius nibh vel dolor dapibus facilisis. Vestibulum a felis et urna cursus dignissim. Morbi pretium bibendum odio, vel interdum tellus mattis a. Sed vitae erat sem.';

  PageView generatePages(text) {
    final double height = Get.height;
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

  List<Item> listItem = [
    Item(id: 1, name: 'Item 1'),
    Item(id: 2, name: 'Item 2'),
    Item(id: 3, name: 'Item 3'),
    Item(id: 4, name: 'Item 4'),
    Item(id: 5, name: 'Item 5'),
    Item(id: 6, name: 'Item 6'),
    Item(id: 7, name: 'Item 7'),
    Item(id: 8, name: 'Item 8'),
    Item(id: 9, name: 'Item 9'),
    Item(id: 10, name: 'Item 10'),
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
    batteryLvl.value = await battery.value.batteryLevel;
    battery.value.onBatteryStateChanged.listen((BatteryState state) async {
      // Do something with new state
      batteryLvl.value = await battery.value.batteryLevel;
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
