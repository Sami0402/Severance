import 'package:e_commerce_app/modules/Auth/googleSignInButton.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/validators/validators.dart';
import 'package:e_commerce_app/controllers/Auth_controller/register_controller.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterController controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    final isMarked = RxBool(true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller.registerformKey,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      "Let's create your account",
                      style: TypographyPoppins.Bold.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  // FIRST NAME & LAST NAME
                  Row(
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
                  customTextField(
                    validator: Validators.email,
                    hintText: "E-Mail",
                    controller: controller.email,
                    prefixIcon: Icons.mail_outlined,
                  ),
                  SizedBox(height: 20),
                  customTextField(
                    validator: Validators.phoneNumber,
                    hintText: "Phone Number",
                    controller: controller.phoneNumber,
                    prefixIcon: Icons.phone_outlined,
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
                        ? Icon(Icons.check_box, color: Colors.indigoAccent)
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
              onPressed: controller.signUpValidation,
            ),
          ),
          SizedBox(height: 20),
          // OR SIGN U1N WITH text
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              "Or Sign Up With",
              style: TypographyPoppins.SemiBold.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 10),
          // GOOGLE logo
          googleSignInButton(),
        ],
      ),
    );
  }
}
