import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.shoe});

  final Cart shoe;

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();
    final String fullImageUrl = controller.url + shoe.image!;

    return InkWell(
      onTap: () => {
        // PRODUCT DETAIL
      },
      child: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(vertical: 12).copyWith(left: 14),
            decoration: BoxDecoration(
              color: Appcolor.WHITE,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.15,
                  width: SizeConfig.screenWidth * 0.24,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: fullImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.04),

                // NAME . CATEGORY . PRICE
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        shoe.name!,
                        maxLines: 1,
                        style: TypographyPoppins.displaySmall.copyWith(
                          color: Appcolor.GREY,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.005),
                    Row(
                      children: [
                        Text(
                          shoe.category!,
                          style: TypographyPoppins.labelSmall.copyWith(
                            color: Appcolor.GREY,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "·",
                          style: TypographyPoppins.labelSmall.copyWith(
                            color: Appcolor.GREY,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          shoe.selectedSize!,
                          style: TypographyPoppins.labelSmall.copyWith(
                            color: Appcolor.GREY,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenWidth * 0.020),

                    // PRICE & INCREAMENT AND DECREAMENT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${shoe.price!.toString()}",
                          style: TypographyPoppins.displaySmall.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 75),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                                Text(shoe.quantity!.toString()),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
          // DELETE
          Positioned(
            right: 8.0,
            top: 10.0,
            child: IconButton(
              splashColor: Colors.grey.shade400,
              onPressed: () {
                controller.deleteCartItem(shoe.id!, shoe.selectedSize!);
              },
              icon: Icon(CupertinoIcons.delete_simple, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
