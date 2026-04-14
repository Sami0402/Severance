import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
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
    required this.controller, required this.imageUrl, required this.name, required this.category, required this.price, required this.title, required this.description,
  });

  final String imageUrl; 
  final String name;
  final String category;
  final int price;
  final String title;
  final String description;
  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetail(imageUrl: imageUrl, name: name, price: price, category: category, title: title, description: description,));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: SizeConfig.screenWidth * 0.08,
          left: SizeConfig.screenWidth * 0.025,
        ),
        height: SizeConfig.screenHeight * 0.36,
        width: SizeConfig.screenWidth * 0.55,
    
        decoration: BoxDecoration(
          color: const Color.fromARGB(
            255,
            245,
            250,
            252,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.05,
              ),
              spreadRadius: 6,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // IMAGE
                SizedBox(
                  height:
                      SizeConfig.screenHeight *
                      0.22,
                  width:
                      SizeConfig.screenWidth * 0.60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
    
                    child: Image.network(
                      "http://192.168.1.8:3000/uploads/${imageUrl}",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // LIKE ICON
                Positioned(
                  right:
                      SizeConfig.screenWidth *
                      0.008,
                  top:
                      SizeConfig.screenHeight *
                      0.008,
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        controller.isLiked.value =
                            !controller
                                .isLiked
                                .value;
                      },
                      icon: controller.isLiked.value
                          ? Icon(
                              Icons.favorite,
                              color: Colors.black,
                              size:
                                  SizeConfig
                                      .screenHeight *
                                  0.01,
                            )
                          : Icon(
                              Icons
                                  .favorite_border_outlined,
                              color: Colors
                                  .grey
                                  .shade600
                                  .withValues(
                                    alpha: 0.5,
                                  ),
                              size:
                                  SizeConfig
                                      .screenHeight *
                                  0.03,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            // SHOE NAME
            Padding(
              padding: EdgeInsets.only(
                left:
                    SizeConfig.screenWidth * 0.033,
              ),
              child: SizedBox(
                width:
                    MediaQuery.of(
                      context,
                    ).size.width *
                    0.5,
                child: Text(
                  name,
                  style: TypographyPoppins
                      .displayMedium
                      .copyWith(height: 1.0),
                ),
              ),
            ),
            SizedBox(
              height:
                  SizeConfig.screenHeight * 0.01,
            ),
            // SHOE Cateogry & SHOE PRICE
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    SizeConfig.screenWidth * 0.035,
              ),
              child: Row(
                children: [
                  Text(
                    category,
                    style: TypographyPoppins
                        .labelSmall
                        .copyWith(
                          color: Appcolor.GREY,
                          fontSize:
                              SizeConfig
                                  .screenHeight *
                              0.018,
                        ),
                  ),
                  Spacer(),
                  Text(
                    "\$${price}",
                    style: TypographyPoppins
                        .labelSmall
                        .copyWith(
                          color: Appcolor.GREY,
                          fontWeight:
                              FontWeight.w600,
                          fontSize:
                              SizeConfig
                                  .screenHeight *
                              0.030,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  SizeConfig.screenHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
