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
              margin: EdgeInsets.only(top: 45),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CachedNetworkImage(
                imageUrl: fullImageUrl,
                width: double.infinity,
              ),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  shoe.name!,
                  maxLines: 2,

                  style: TypographyPoppins.displaySmall.copyWith(
                    fontSize: 22,
                    height: 1.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "\$${shoe.price}",
                  style: TypographyPoppins.labelSmall.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
