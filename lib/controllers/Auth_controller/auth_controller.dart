import "package:e_commerce_app/services/api_service.dart";
import "package:e_commerce_app/utils/constants/routes.dart";
import "package:e_commerce_app/utils/validators/validators.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class AuthController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  

   // For login with Email & Password
  Future login() async {
    final result = await apiService.loginUser(
      email.text,
      password.text,
    );
    if (result["success"]) {
      Get.offAndToNamed(Routes.homeScreen);
    } else {
      throw Exception("Login failed: $result");
    }
  }

  // For SingUp with Email & Password
  Future register() async {
    final result = await apiService.registerUser(
      firstName.text,
      lastName.text,
      username.text,
      email.text,
      password.text,
    );

    if (result["success"]) {
      Get.offAndToNamed(Routes.homeScreen);
    } else if (result["message"] == "User already exist") {
      Validators.email(email.text, message: "User already exist");
    }
    else {
      throw Exception("Register failed: $result");
    }
  }




   @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.onClose();
  }
}
