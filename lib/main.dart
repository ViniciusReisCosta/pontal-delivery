import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontal_delivery/pages/auth/controller/auth_controller.dart';
import 'package:pontal_delivery/pages/splash/splash_screen.dart';
import 'package:pontal_delivery/pages_routes/app_pages.dart';

import 'pages/auth/sign_in_screen.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pontal Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
