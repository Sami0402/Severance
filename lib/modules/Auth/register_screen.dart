import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthController controller = AuthController();
  final registerformKey = GlobalKey<FormState>();
  final isMarked = RxBool(true);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: registerformKey,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      "Let's \ncreate your account",
                      style: TypographyPoppins.displayMedium,
                    ),
                  ),
                  SizedBox(height: 20),
                  // FIRST NAME & LAST NAME
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: customTextField(
                          validator: Validators.firstName,
                          hintText: 'First Name',
                          controller: controller.firstName,
                          prefixIcon: Icons.person_outlined,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: customTextField(
                          validator: Validators.lastName,
                          hintText: 'Last Name',
                          controller: controller.lastName,
                          prefixIcon: Icons.person_outlined,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // USRENAME, EMAIL, PHONE NUMBER, PASSWORD
                  customTextField(
                    validator: Validators.username,
                    hintText: "Username",
                    controller: controller.username,
                    prefixIcon: Icons.person_add_outlined,
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => customTextField(
                      validator: Validators.email,
                      hintText: "E-Mail",
                      controller: controller.email,
                      prefixIcon: Icons.mail_outlined,
                      errorText: controller.emailError.value,
                    ),
                  ),
                  SizedBox(height: 20),
                  customTextField(
                    validator: Validators.signUpPassword,
                    hintText: "Password",
                    controller: controller.password,
                    prefixIcon: Icons.lock_open_outlined,
                    showSufixIcon: true,
                    suffixIcon: Icons.visibility_off_outlined,
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
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
                Text(
                  'I agree to Privacy Policy and Terms of use',
                  style: TypographyPoppins.Regular.copyWith(
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: solidTextButton(
              text: 'Create Account',
              onPressed: () async {
                if (registerformKey.currentState!.validate()) {
                  await controller.register();
                }
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
