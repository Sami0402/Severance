import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/home_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/cart_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/profile_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/search_screen.dart';
import 'package:e_commerce_app/widgets/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            onPageChanged: controller.changePage,

            children: [
              HomeScreen(),
              SearchScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
