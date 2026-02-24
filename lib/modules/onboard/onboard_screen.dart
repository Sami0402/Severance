import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/controllers/onboard_controller.dart';
import 'package:e_commerce_app/modules/onboard/widgets/Animated_dot.dart';
import 'package:e_commerce_app/modules/onboard/widgets/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});
  final OnboardController controller = Get.put(OnboardController());
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final _totalPage = controller.onboardContent.length;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150),
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                controller.selectedIndex.value = index;
              },

              itemCount: controller.onboardContent.length,
              itemBuilder: (context, index) {
                return OnboardPage(
                  image: controller.onboardContent[index]["image"],
                  title: controller.onboardContent[index]["title"],
                  description: controller.onboardContent[index]["description"],
                );
              },
            ),
          ),
          SizedBox(height: 80),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Row(
                children: List.generate(
                  controller.onboardContent.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: AnimatedDot(
                      isActive: controller.selectedIndex.value == index,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Checks Wheather the next page/Widget is available or not
            if (_pageController.hasClients) {
              // Before last page, FloatingButton will just change the Page after that we will navigate to loginScreen
              if (controller.selectedIndex.value < _totalPage - 1) {
                _pageController.nextPage(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                Get.toNamed(Routes.loginScreen);
              }
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey[800]),
            shape: WidgetStatePropertyAll(CircleBorder()),
            iconSize: WidgetStatePropertyAll(20),
          ),
          child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
