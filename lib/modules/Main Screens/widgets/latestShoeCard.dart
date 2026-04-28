import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LatestShoesCard extends StatelessWidget {
  const LatestShoesCard({super.key, required this.shoe});

  final Data shoe;

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    final String fullImageUrl = controller.url + shoe.image!;

    return InkWell(
      onTap: () {
        Get.to(() => ProductDetail(shoe: shoe));
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(
            right: SizeConfig.screenWidth * 0.042,
            left: SizeConfig.screenWidth * 0.02,
          ),

          height: SizeConfig.screenHeight * 0.13,
          width: SizeConfig.screenWidth * 0.235,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(14),
            // color: Appcolor.BLACK,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              imageUrl: fullImageUrl,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
