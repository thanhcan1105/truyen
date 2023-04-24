import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/controllers/home_controller.dart';

import '../categories/categories.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Trang chủ',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(text: 'Danh mục'),
              Tab(text: 'Truyện mới'),
              Tab(text: 'Truyện FULL'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Category(),
            Center(
              child: Text('Truyện mới'),
            ),
            Center(
              child: Text('Truyện full'),
            ),
          ],
        ),
      ),
    );
  }
}
