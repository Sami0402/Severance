import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LargeProductCard extends StatelessWidget {
  const LargeProductCard({
    super.key,
    required this.controller,
    required this.shoe,
  });

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
        margin: EdgeInsets.only(right: 23, left: 15),

        width: 220,
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
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // LIKE ICON
                Positioned(
                  right: 6,
                  top: 4,
                  child: Obx(
                    () => IconButton(
                      onPressed: () async {
                        controller.toggleLike(shoe);
                        await ApiService.toggleLike(shoe.id!);
                        await controller.getWishlist();
                      },
                      icon: shoe.isLiked.value == true
                          ? Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.black54,
                              size: 22,
                            )
                          : Icon(
                              CupertinoIcons.heart,
                              color: Colors.grey.shade600.withValues(
                                alpha: 0.5,
                              ),

                              size: 22,
                            ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 45),
                  height: 190,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),

                    child: CachedNetworkImage(
                      imageUrl: fullImageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // SHOE NAME
            Container(
              width: 220,
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                maxLines: 2,
                shoe.name!,
                style: TypographyPoppins.displaySmall.copyWith(height: 1.1),
              ),
            ),
            SizedBox(height: 10),
            // SHOE RATING & SHOE PRICE
            Padding(
              padding: EdgeInsets.only(left: 15, right: 22),
              child: Row(
                children: [
                  RatingBar.readOnly(
                    size: 15,
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
                  SizedBox(width: 5),
                  Text(
                    shoe.rating!.toString(),
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$${shoe.price}",
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Appcolor.GREY,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
