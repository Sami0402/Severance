import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({super.key, required this.shoe});

  final Data shoe;

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();
    final String fullImageUrl = controller.url + shoe.image!;
    return InkWell(
      onTap: () => Get.to(() => ProductDetail(shoe: shoe)),
      child: Slidable(
        key: ValueKey(shoe.id!),

        // Add to cart
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  // ADD TO CART LOGIC
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: SizeConfig.screenWidth * 0.4,
                  height: SizeConfig.screenHeight,
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.white,
                    size: SizeConfig.screenHeight * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Remove from wishlist
        endActionPane: ActionPane(
          dismissible: DismissiblePane(
            dismissalDuration: Duration(microseconds: 200),
            onDismissed: () {
              controller.removeWishlistItem(shoe.id!, shoe);
            },
            motion: StretchMotion(),
          ),
          motion: const StretchMotion(),
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  controller.removeWishlistItem(shoe.id!, shoe);
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  alignment: Alignment.centerRight,
                  width: SizeConfig.screenWidth * 0.4,
                  height: SizeConfig.screenHeight,
                  padding: EdgeInsets.only(
                    right: SizeConfig.screenWidth * 0.15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: SizeConfig.screenHeight * 0.035,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Actual card
        child: Container(
          height: SizeConfig.screenHeight * 0.17,
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
            vertical: SizeConfig.screenHeight * 0.018,
          ),
          decoration: BoxDecoration(
            color: Appcolor.WHITE,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Image
              Container(
                height: SizeConfig.screenHeight * 0.14,
                width: SizeConfig.screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: fullImageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.04),

              // NAME CATEGORY PRICE
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.45,
                    child: Text(
                      shoe.name!,

                      maxLines: 2,
                      style: TypographyPoppins.displaySmall.copyWith(
                        color: Appcolor.GREY,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.003),
                  Text(
                    shoe.category!,
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Appcolor.GREY,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenWidth * 0.012),
                  Text(
                    "\$${shoe.price.toString()}",
                    style: TypographyPoppins.labelSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
