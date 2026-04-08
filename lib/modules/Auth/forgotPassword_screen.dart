import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Forgotpassword extends StatelessWidget {
  Forgotpassword({super.key});

  final AuthController controller = AuthController();

  final _forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Row(
              children: [
                SizedBox(width: 12),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new, size: 20),
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                SizedBox(width: 4),
                Text('Back', style: TypographyPoppins.Medium),
              ],
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 60, right: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Password',
                    style: TypographyPoppins.SemiBold.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Enter the email or phone number associated with your \naccount, and we'll email you the verification code to reset \nyour password.",
                    style: TypographyPoppins.Regular.copyWith(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Form(
                    key: _forgotPasswordFormKey,
                    child: customTextField(
                      hintText: 'Email',
                      controller: controller.email,
                      // validator: Validators.email,
                    ),
                  ),
                  SizedBox(height: 18),
                  solidTextButton(
                    text: "Continue",
                    onPressed: () {
                      if (_forgotPasswordFormKey.currentState!.validate()) {
                        // _auth.verifyEmail();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
