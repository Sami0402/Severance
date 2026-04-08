import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/modules/Auth/login_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();

    return Obx(() {
      if (controller.isLoggedIn.value == null) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (controller.isLoggedIn.value == false) {
        return LoginScreen();
      } else {
        return MainScreen();
      }
    });
  }
}
