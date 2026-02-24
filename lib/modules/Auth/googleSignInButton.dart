import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/controllers/Auth_controller/googleAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class googleSignInButton extends StatelessWidget {
  const googleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 0.5,
            color: Colors.grey.shade400,
          ),
        ),
        child: Image.asset(Images.google),
      ),
      onTap: () async {
        User? user = await googleAuthService().signInWithGoogle();
        if (user != null) {
          Get.offAllNamed(
            Routes.homeScreen,
            arguments: user.displayName,
          );
        }
      },
    );
  }
}