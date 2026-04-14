import "package:e_commerce_app/services/api_service.dart";
import "package:e_commerce_app/utils/constants/routes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  var emailError = RxnString();
  var passwordError = RxnString();
  var isLoggedIn = RxnBool(null);

  // For login with Email & Password
  Future login() async {
    final result = await ApiService.loginUser(email.text, password.text);
    final prefs = await SharedPreferences.getInstance();
    if (result["success"]) {
      await prefs.setString("id", result["user"]["id"]);
      await prefs.setString("email", result["user"]["email"]);
      await prefs.setString("token", result["token"]);
      await prefs.setBool("isLoggedIn", true);
      isLoggedIn.value = true;

      Get.offAndToNamed(Routes.MainScreen);
    } else if (result["message"] == "User not found!") {
      passwordError.value = null;
      emailError.value = result["message"];
    } else if (result["message"] == "Wrong Password") {
      emailError.value = null;
      passwordError.value = result["message"];
    }
  }

  // For SingUp with Email & Password
  Future register() async {
    final result = await ApiService.registerUser(
      firstName.text,
      lastName.text,
      username.text,
      email.text,
      password.text,
    );

    final prefs = await SharedPreferences.getInstance();

    if (result["success"]) {
      await prefs.setBool("isLoggedIn", true);
      await prefs.setString("id", result["user"]["id"]);
      await prefs.setString("id", result["user"]["firstName"]);
      await prefs.setString("id", result["user"]["lastName"]);
      await prefs.setString("id", result["user"]["username"]);
      await prefs.setString("id", result["user"]["email"]);
      Get.offAndToNamed(Routes.MainScreen);
    } else if (result["message"] == "User already exist") {
      emailError.value = result["message"];
    }
  }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool("isLoggedIn") ?? false;
  }

  @override
  void onReady() {
    checkAuth();
    super.onReady();
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    emailError.close();
    passwordError.close;
    super.onClose();
  }
}
