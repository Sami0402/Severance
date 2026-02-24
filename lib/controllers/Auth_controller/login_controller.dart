import "package:e_commerce_app/utils/constants/routes.dart";
import "package:e_commerce_app/utils/helpers/helpers.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // For SignIn by Email & Password
  Future signInValidation() async {
    String message = "";

    // All fields are valid
    print('Form is valid');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offAndToNamed(Routes.homeScreen, arguments: email.text),
      );
    } on FirebaseAuthException catch (e) {
      print("Firebase Error Code: ${e.code}");
      switch (e.code) {
        case 'invalid-credential':
          message = 'Invalid email or password.';
          break;

        case 'user-not-found':
          message = 'No user found for this email.';
          break;

        case 'wrong-password':
          message = 'Wrong password.';
          break;

        case 'invalid-email':
          message = 'Invalid email format.';
          break;

        case 'too-many-requests':
          message = 'Too many attempts. Try again later.';
          break;

        default:
          message = 'Login failed. ${e.message}';
      }
      Helpers.customFlutterToast(message);
    }
  }

  // For Forgot password
  Future verifyEmail() async {
    // Shows Cicular Progress
    await Future.delayed(Duration(seconds: 3), () {
      Get.dialog(
        barrierDismissible: false,
        Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    });

    // Send Password Reset Email
    try {
      print('Email is: ${email.text.trim()}');
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text.trim(),
      );
      Helpers.customFlutterToast('Password Reset Email Sent');
      Get.offAndToNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (e) {
      print(e);

      Helpers.customFlutterToast('$e');
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
