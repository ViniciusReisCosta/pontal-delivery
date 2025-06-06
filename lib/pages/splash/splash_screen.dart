import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontal_delivery/config/custom_colors.dart';
import 'package:pontal_delivery/pages/common_widgets/app_name_widget.dart';
import 'package:pontal_delivery/pages_routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Executa o redirecionamento após o primeiro frame
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PagesRoutes.signInRoute);
    });

    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
