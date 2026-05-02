import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();
    SizeConfig.init(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
        ).copyWith(bottom: SizeConfig.screenHeight * 0.033),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.025,
        ),
        width: SizeConfig.screenWidth * 0.85,
        height: SizeConfig.screenHeight * 0.080,
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
                    ? SvgPicture.asset(
                        Images.homeSelected,
                        width: SizeConfig.screenWidth * 0.062,
                      )
                    : SvgPicture.asset(
                        Images.homeUnselected,
                        width: SizeConfig.screenWidth * 0.062,
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
                    ? SvgPicture.asset(
                        Images.searchSelected,
                        width: SizeConfig.screenWidth * 0.062,
                      )
                    : SvgPicture.asset(
                        Images.searchUnselected,
                        width: SizeConfig.screenWidth * 0.062,
                      ),
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
                        CupertinoIcons.heart_fill,
                        color: Appcolor.WHITE,
                        size: SizeConfig.screenWidth * 0.066,
                      )
                    : Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,
                        size: SizeConfig.screenWidth * 0.066,
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
                        Icons.shopping_basket_sharp,
                        color: Appcolor.WHITE,
                        size: SizeConfig.screenWidth * 0.066,
                      )
                    : Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                        size: SizeConfig.screenWidth * 0.066,
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
                    ? Icon(
                        CupertinoIcons.person_fill,
                        color: Appcolor.WHITE,
                        size: SizeConfig.screenWidth * 0.066,
                      )
                    : Icon(
                        CupertinoIcons.person,
                        color: Colors.white,
                        size: SizeConfig.screenWidth * 0.066,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
