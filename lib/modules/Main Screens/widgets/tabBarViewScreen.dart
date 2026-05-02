import 'dart:math' as MainAxisSize;

import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/show_all_product_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/largeProductCard.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/latestShoeCard.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TabBarViewScreen extends StatelessWidget {
  TabBarViewScreen({super.key, required this.shoe});

  final MainScreenController controller = Get.find<MainScreenController>();
  final List<Data> shoe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // LARGE SHOE CARDS
        SizedBox(
          height: SizeConfig.screenHeight * 0.36,
          child: Obx(() {
            if (controller.isLoading.value) {
              
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LargeProductCard(
                  controller: controller,
                  shoe: shoe[index],
                );
              },
            );
          }),
        ),

        SizedBox(height: SizeConfig.screenHeight * 0.030),
        // LATEST SHOES
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Shoes',
              style: TypographyPoppins.displayMedium.copyWith(
                fontSize: SizeConfig.screenHeight * 0.028,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.03),
              child: InkWell(
                onTap: () => Get.to(() => ShowAllProduct(shoe: shoe)),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Show all',
                      style: TypographyPoppins.labelSmall.copyWith(
                        color: Appcolor.BLACK,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_outlined,
                      size: SizeConfig.screenHeight * 0.035,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: SizeConfig.screenHeight * 0.16,

          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                final fromLast = (shoe.length - (index + 8));
                return LatestShoesCard(shoe: shoe[fromLast]);
              },
            );
          }),
        ),
      ],
    );
  }
}
