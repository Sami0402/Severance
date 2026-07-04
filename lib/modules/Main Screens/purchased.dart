import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class PurchasedScreen extends StatelessWidget {
  const PurchasedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 140, child: Image.asset(Images.purchased)),

                  SizedBox(height: 35),
                  Text("Thank You!", style: TypographyPoppins.displayLarge),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 105.0),
                    child: solidTextButton(
                      text: 'Go Back Home',
                      onPressed: () => {
                        controller.selectedIndex.value = 0,
                        Get.offAllNamed(Routes.MainScreen),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
