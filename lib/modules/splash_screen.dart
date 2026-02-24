import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(child: Image.asset(Images.splashIcon, fit: BoxFit.cover)),
    );
  }
}
