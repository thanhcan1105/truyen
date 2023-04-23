import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChapter extends GetView {
  const ListChapter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .3,
        title: const Text(
          'DS. Chương',
          style: TextStyle(
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
      body: Container(
        constraints: BoxConstraints(
          minHeight: Get.height,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('${index + 1}. Teen chuongw'),
            );
          },
        ),
      ),
    );
  }
}
