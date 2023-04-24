import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/controllers/chapter_view_controller.dart';

class MyPaginatedText extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);
  ChapterViewController controller = Get.put(ChapterViewController());

  @override
  Widget build(BuildContext context) {
    final pageHeight = 200.0;
    final pageWidth = 200.0;
    // const text =
    //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed ante at leo vehicula tincidunt. Donec a velit quam. Fusce nec lorem magna. Donec semper eros eu est commodo rutrum. Nulla facilisi. Nullam faucibus eros quis nulla elementum, nec placerat nisi pellentesque. Etiam consectetur pharetra dui, quis maximus metus. Suspendisse in lacinia mauris. In eget velit mauris. Suspendisse potenti. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ultricies sapien vitae nulla tempor efficitur. Maecenas lobortis enim in leo varius, id fringilla massa luctus. Maecenas facilisis erat eget tortor malesuada, ut dictum libero pulvinar. Nam vel nunc ut lorem vestibulum ultrices. Integer a ante odio. Curabitur non tortor non felis consectetur sodales ut in purus. Vivamus vel diam ac nulla dignissim tincidunt. Aenean consequat augue ut libero rhoncus, ac pharetra sapien accumsan. In hac habitasse platea dictumst. Proin bibendum mauris a lacus luctus efficitur. Sed at lectus eu lacus eleifend tincidunt. Sed nec nibh a urna suscipit tempor. Morbi aliquet laoreet purus, nec eleifend magna pretium ac. Nullam bibendum erat id massa congue, eu bibendum sapien tincidunt. Sed maximus purus eu dui tincidunt, at lobortis nisl pellentesque. Sed blandit, nisi eget hendrerit fringilla, massa arcu fermentum metus, quis consectetur est turpis vel velit. Cras nec tristique metus. Etiam mollis mauris nulla, id hendrerit neque interdum nec. Sed varius nibh vel dolor dapibus facilisis. Vestibulum a felis et urna cursus dignissim. Morbi pretium bibendum odio, vel interdum tellus mattis a. Sed vitae erat sem.';
    final text = controller.chuoi;
    final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 20),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1)
      ..layout();

    final charsPerLine = (pageWidth / textPainter.width * text.length).floor();
    final linesPerPage = (pageHeight / textPainter.height).floor();
    final charsPerPage = charsPerLine * linesPerPage;

    print('asfasdfasdf $charsPerPage');
    print('asfasdf $linesPerPage');
    print('object ${text.length}');

    final pages = <String>[];
    for (var i = 0; i < text.length; i += charsPerPage) {
      pages.add(text.substring(i, i + charsPerLine));
    }

    final pageViews = pages
        .map(
          (pageText) => Container(
            child: Text(
              pageText,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: SafeArea(
        child: PageView(children: pageViews),
      ),
    );
  }
}
