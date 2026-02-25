import 'package:e_commerce_app/modules/Auth/googleSignInButton.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:e_commerce_app/controllers/Auth_controller/login_controller.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find<LoginController>();
  final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isMarked = RxBool(true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _loginformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Images.splashIcon,
                  height: 180,
                  alignment: AlignmentGeometry.topLeft,
                ),
                Text(
                  'Welcome back,',
                  style: TypographyPoppins.Bold.copyWith(fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "Discover Limitless Choices and Unmatched Convenience.",
                  style: TypographyRoboto.Regular.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 30),
                customTextField(
                  validator: Validators.email,
                  hintText: "E-Mail",
                  prefixIcon: Icons.mail_outlined,
                  controller: controller.email,
                ),
                SizedBox(height: 20),
                customTextField(
                  validator: Validators.signInPassword,
                  hintText: "Password",
                  controller: controller.password,
                  prefixIcon: Icons.lock_reset_sharp,
                  isObsecure: true,
                  showSufixIcon: true,
                  suffixIcon: Icons.visibility_outlined,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          isMarked.value = !isMarked.value;
                        },
                        icon: isMarked.value
                            ? Icon(Icons.check_box, color: Colors.indigoAccent)
                            : Icon(Icons.check_box_outline_blank),
                      ),
                    ),
                    Text('Remember Me', style: TypographyPoppins.SemiBold),
                    Spacer(),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.forgotPasswordScreen),
                      child: Text(
                        'Forgot Password?',
                        style: TypographyPoppins.Medium.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // SIGN IN Button
                solidTextButton(
                  text: 'Sign In',
                  onPressed: () {
                     if (_loginformKey.currentState!.validate()) {
                      controller.signIn();
                     }
                    }
                  
                ),
                SizedBox(height: 10),
                // Create Account Button
                SizedBox(
                  height: 45.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.registerScreen);
                    },
                    style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    child: Text(
                      'Create Account',
                      style: TypographyPoppins.SemiBold.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // OR SIGN IN WITH text
                Align(
                  alignment: AlignmentGeometry.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Or Sign In With",
                      style: TypographyPoppins.SemiBold.copyWith(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // GOOGLE logo
                googleSignInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
