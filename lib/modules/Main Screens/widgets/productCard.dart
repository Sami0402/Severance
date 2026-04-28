import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.height, required this.shoe});

  final Data shoe;
  final double height;

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    
    final String fullImageUrl = controller.url + shoe.image!;

    return InkWell(
      onTap: () => Get.to(ProductDetail(shoe: shoe)),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              spreadRadius: 6,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.035),

              // height: SizeConfig.screenHeight * 0.18,
              // width: SizeConfig.screenWidth,
              child: CachedNetworkImage(
                imageUrl: fullImageUrl,
                // fit: BoxFit.contain,
                height: SizeConfig.screenHeight * 0.15,
                width: SizeConfig.screenWidth * 0.35,
              ),
            ),
            // LIKE ICON
            // Positioned(
            //   right: SizeConfig.screenWidth * 0.0,
            //   top: SizeConfig.screenHeight * 0.0,
            //   child: Obx(
            //     () => IconButton(
            //       onPressed: () {
            //         controller.isLiked.value = !controller.isLiked.value;
            //       },
            //       icon: controller.isLiked.value
            //           ? Icon(
            //               CupertinoIcons.heart_fill,
            //               color: Colors.black,
            //               size: SizeConfig.screenHeight * 0.025,
            //             )
            //           : Icon(
            //               CupertinoIcons.heart,
            //               color: Colors.grey.shade600.withValues(alpha: 0.5),
            //               size: SizeConfig.screenHeight * 0.025,
            //             ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: SizeConfig.screenHeight * 0.003),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.048,
              ),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  shoe.name!,
                  maxLines: 2,

                  style: TypographyPoppins.displaySmall.copyWith(
                    fontSize: SizeConfig.screenHeight * 0.025,
                    height: 1.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.048,
              ),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "\$${shoe.price}",
                  style: TypographyPoppins.labelSmall.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.029),
          ],
        ),
      ),
    );
  }
}
