import "package:e_commerce_app/utils/constants/routes.dart";
import "package:e_commerce_app/utils/helpers/helpers.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/get_navigation.dart";
import "package:get/get_state_manager/src/simple/get_controllers.dart";

class RegisterController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  var registerformKey = GlobalKey<FormState>();

  Future signUpValidation() async {
    String message = "";
    if (registerformKey.currentState!.validate()) {
      // All fields are valid
      print('Form is valid');
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.toNamed(Routes.homeScreen, arguments: firstName.text),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'An account already exists with that email.';
        }
        Helpers.customFlutterToast(message);
      } catch (e) {
        Helpers.customFlutterToast("Failed: $e");
      }
    } else {
      // Some fields are invalid
      print('Form is invalid');
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
