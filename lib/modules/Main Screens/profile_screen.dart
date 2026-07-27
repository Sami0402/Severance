import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/privacy_policy_screen.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: TypographyPoppins.displaySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 45,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.person,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // NAME
                                Text(
                                  "${MainScreenController.firstName}",
                                  style: TypographyPoppins.displayMedium,
                                ),
                                // NUMBER
                                Text(
                                  "1234567890",
                                  style: TypographyPoppins.labelSmall.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                // EMAIL
                                Text(
                                  "${MainScreenController.email}",
                                  style: TypographyPoppins.labelSmall.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),

                      SizedBox(height: 35),
                      // PRIVACY POLICY
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 25),
                        // leading: Icon(Icons.lock_outline_rounded),
                        title: Text(
                          "Privacy Policy",
                          style: TypographyPoppins.displayMedium,
                        ),
                        trailing: IconButton(
                          onPressed: () => Get.to(() => PrivacyPolicyScreen()),
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                      SizedBox(height: 20),
                      // LOGOUT
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 25),
                        // leading: Icon(Icons.lock_outline_rounded),
                        title: Text(
                          "Log Out",
                          style: TypographyPoppins.displayMedium,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Get.find<AuthController>().logout();
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Circular Avatar
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
