import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.find<AuthController>();
  final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMarked = RxBool(true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _loginformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.23),
                Text('Welcome back,', style: theme.textTheme.displayLarge),
                SizedBox(height: 10),
                Text(
                  "Discover Limitless Choices and Unmatched Convenience.",
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 15),
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
                            ? Icon(Icons.check_box, color: Appcolor.BLACK)
                            : Icon(Icons.check_box_outline_blank),
                      ),
                    ),
                    Text('Remember Me', style: TypographyPoppins.SemiBold),
                    Spacer(),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.forgotPasswordScreen),
                      style: theme.textButtonTheme.style!.copyWith(
                        backgroundColor: WidgetStatePropertyAll(Appcolor.WHITE),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: TypographyPoppins.Medium.copyWith(
                          color: Appcolor.GREY,
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
                      controller.login();
                    }
                  },
                ),
                SizedBox(height: 10),
                // Create Account Button
                SizedBox(
                  height: 52.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.registerScreen);
                    },
                    style: theme.textButtonTheme.style!.copyWith(
                      backgroundColor: WidgetStatePropertyAll(Appcolor.WHITE),
                      elevation: WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                   
                    child: Text(
                      'Create Account',
                      style: TypographyPoppins.Medium.copyWith(
                        color: Appcolor.BLACK,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
