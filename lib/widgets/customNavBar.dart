import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 12),
        width: MediaQuery.sizeOf(context).width * 0.85,
        height: MediaQuery.sizeOf(context).height * 0.065,
        decoration: BoxDecoration(
          color: Appcolor.BLACK,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 0;
                  controller.nextPage(0);
                },
                child: controller.selectedIndex.value == 0
                    ? Icon(Icons.home, color: Appcolor.WHITE, size: 30)
                    : Icon(
                        Icons.home_outlined,
                        color: Appcolor.WHITE,
                        size: 30,
                      ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 1;
                  controller.nextPage(1);
                },
                child: controller.selectedIndex.value == 1
                    ? Icon(
                        Icons.saved_search_sharp,
                        color: Appcolor.WHITE,
                        size: 30,
                      )
                    : Icon(Icons.search, color: Appcolor.WHITE, size: 30),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 2;
                  controller.nextPage(2);
                },
                child: controller.selectedIndex.value == 2
                    ? Icon(
                        Icons.favorite_outlined,
                        color: Appcolor.WHITE,
                        size: 30,
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color: Appcolor.WHITE,
                        size: 30,
                      ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 3;
                  controller.nextPage(3);
                },
                child: controller.selectedIndex.value == 3
                    ? Icon(
                        Icons.shopping_basket_rounded,
                        color: Appcolor.WHITE,
                        size: 30,
                      )
                    : Icon(
                        Icons.shopping_basket_outlined,
                        color: Appcolor.WHITE,
                        size: 30,
                      ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 4;
                  controller.nextPage(4);
                },
                child: controller.selectedIndex.value == 4
                    ? Icon(Icons.person, color: Appcolor.WHITE, size: 30)
                    : Icon(
                        Icons.person_outline,
                        color: Appcolor.WHITE,
                        size: 30,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
