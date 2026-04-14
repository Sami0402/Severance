import 'dart:math' as MainAxisSize;

import 'package:e_commerce_app/controllers/main_screen_controller.dart';
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
  const TabBarViewScreen({super.key, required this.controller});

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // LARGE SHOE CARDS
        SizedBox(
          height: SizeConfig.screenHeight * 0.36,
          child: Obx(            
            () {
              if(controller.isLoading.value){
                return Center(child: CircularProgressIndicator());
              }
            
            return ListView.builder(
              clipBehavior: Clip.none,
              itemCount: controller.shoeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var shoe = controller.shoeList[index];
                return LargeProductCard(controller: controller, name: shoe.name!, category: shoe.category!, imageUrl: shoe.image!,price: shoe.price!, title: shoe.title!, description: shoe.description!);
              },
            );
            }
            
          ),
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
                onTap: () => Get.toNamed(Routes.showAllProduct),
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

          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return LatestShoesCard();
            },
          ),
        ),
      ],
    );
  }
}
