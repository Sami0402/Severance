import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LargeProductCard extends StatelessWidget {
  const LargeProductCard({super.key, required this.controller, required this.shoe});

  final Data shoe;

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    
    final String fullImageUrl = controller.url + shoe.image!;

    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetail(shoe: shoe));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: SizeConfig.screenWidth * 0.08,
          left: SizeConfig.screenWidth * 0.025,
        ),
        height: SizeConfig.screenHeight * 0.36,
        width: SizeConfig.screenWidth * 0.55,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 250, 252),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 6,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // IMAGE
                Container(
                  padding: EdgeInsets.zero,
                  height: SizeConfig.screenHeight * 0.12,
                  width: SizeConfig.screenWidth * 0.60,
                  // color: Colors.amber,
                ),
                // LIKE ICON
                Positioned(
                  right: SizeConfig.screenWidth * 0.009,
                  top: SizeConfig.screenHeight * 0,
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        controller.toggleLike(shoe);
                      },
                      icon: shoe.isLiked.value == true
                          ? Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.black54,
                              size: SizeConfig.screenHeight * 0.028,
                            )
                          : Icon(
                              CupertinoIcons.heart,
                              color: Colors.grey.shade600.withValues(
                                alpha: 0.5,
                              ),

                              size: SizeConfig.screenHeight * 0.028,
                            ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.038,
                  ),
                  // color: Colors.blue,
                  height: SizeConfig.screenHeight * 0.23,
                  width: SizeConfig.screenWidth * 0.60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),

                    child:CachedNetworkImage(imageUrl:  fullImageUrl, fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
            // SHOE NAME
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(right: SizeConfig.screenWidth * 0.033),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.033,
              ),
              child: Text(
                maxLines: 2,
                shoe.name!,
                style: TypographyPoppins.displaySmall.copyWith(height: 1.1),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            // SHOE Cateogry & SHOE PRICE
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.035,
                right: SizeConfig.screenWidth * 0.056,
              ),
              child: Row(
                children: [
                  RatingBar.readOnly(
                    size: SizeConfig.screenHeight * 0.015,
                    isHalfAllowed: true,
                    filledIcon: Icons.star,
                    filledColor: Colors.grey,
                    emptyIcon: Icons.star_border,
                    emptyColor: Appcolor.GREY,
                    halfFilledIcon: Icons.star_half,
                    halfFilledColor: Appcolor.GREY,
                    initialRating: shoe.rating!,
                    maxRating: 5,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                  Text(
                    shoe.rating!.toString(),
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Colors.grey,
                      fontSize: SizeConfig.screenHeight * 0.015,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$${shoe.price}",
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Appcolor.GREY,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.screenHeight * 0.030,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
