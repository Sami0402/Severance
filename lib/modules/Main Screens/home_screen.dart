import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/largeProductCard.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/latestShoeCard.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/tabBarViewScreen.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final MainScreenController controller = Get.find<MainScreenController>();

    return SafeArea(
      child: Stack(
        children: [
          // TOP IMAGE
          Image.asset(Images.topImage, fit: BoxFit.cover),

          // TITLE
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
              vertical: SizeConfig.screenHeight * 0.04,
            ),
            child: Text(
              "Athletics Shoes\nCollection",
              style: TypographyPoppins.displayLarge.copyWith(
                color: Appcolor.WHITE,
                fontSize: SizeConfig.screenWidth * 0.09,
                height: 1.1,
              ),
            ),
          ),

          Column(
            children: [
              // CATEGORY SCROLLER / TabBar
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: SizeConfig.screenHeight * 0.17,
                ),
                child: TabBar(
                  controller: controller.tabController,
                  labelColor: Appcolor.WHITE,
                  unselectedLabelColor: Appcolor.GREY,
                  labelStyle: TypographyPoppins.displayMedium.copyWith(
                    fontSize: 20,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.02),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,

                  isScrollable: true,
                  tabs: [
                    Text("Men Shoes"),
                    Text("Women Shoes"),
                    Text("Kids Shoes"),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.009),
              // TabBarView
              Expanded(
                child: Container(
                  height: SizeConfig.screenHeight,
                  margin: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.025,
                    left: SizeConfig.screenWidth * 0.040,
                  ),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,

                    children: [
                      // MEN SHOES
                      TabBarViewScreen(shoe: controller.menShoes),
                      // WOMEN SHOES
                      TabBarViewScreen(shoe: controller.womenShoes),
                      // KIDS SHOES
                      TabBarViewScreen(shoe: controller.kidsShoes),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
