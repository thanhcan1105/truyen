import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truyen/app/screens/splash/splash_screen.dart';
import 'package:truyen/routes/pages.dart';

import 'app/bindings/splash_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
