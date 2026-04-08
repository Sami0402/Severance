import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();
    return Scaffold(
      // backgroundColor: Colors.white70,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
              ),
              // PRODUCT IMAGE & CANCEL -- CATEGORY -- FAVOURITE
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.40,
                      width: MediaQuery.sizeOf(context).width,
                      child: Image.asset(Images.sample1, fit: BoxFit.fitWidth),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CANCEL
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.clear),
                          ),
                          //CATEGORY
                          Text(
                            "Product Details",
                            style: TypographyPoppins.labelSmall,
                          ),
                          // FAVOURITE
                          Obx(
                            () => IconButton(
                              onPressed: () {
                                controller.isLiked.value =
                                    !controller.isLiked.value;
                              },
                              icon: controller.isLiked.value
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: 24,
                                    )
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                      color: Appcolor.GREY,
                                      size: 24,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.61,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Appcolor.WHITE,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(top: 32, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SHOE NAME
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: Text(
                            "Ultraboost Shoes max max",
                            style: TypographyPoppins.displayLarge.copyWith(
                              fontSize: 35,
                              height: 1.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // SHOW CATEGORY & Rating
                        Row(
                          children: [
                            Text(
                              "Men's Running",
                              style: TypographyPoppins.labelSmall.copyWith(
                                color: Appcolor.GREY,
                              ),
                            ),
                            SizedBox(width: 34),
                            RatingBar.readOnly(
                              size: 18,
                              isHalfAllowed: true,
                              filledIcon: Icons.star,
                              filledColor: Appcolor.BLACK,
                              emptyIcon: Icons.star_border,
                              emptyColor: Appcolor.BLACK,
                              halfFilledColor: Appcolor.BLACK,
                              halfFilledIcon: Icons.star_half,
                              initialRating: 4.5,
                              maxRating: 5,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "4.5",
                              style: TypographyPoppins.labelSmall.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        // PRICE
                        Text(
                          "\$180.00",
                          style: TypographyPoppins.displayLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.024,
                        ),
                        // SELECT SIZE
                        Text(
                          "Select Size",
                          style: TypographyPoppins.labelSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 25),
                                height:
                                    MediaQuery.sizeOf(context).height * 0.081,
                                width: MediaQuery.sizeOf(context).width * 0.11,
                                decoration: BoxDecoration(
                                  border: BoxBorder.all(color: Appcolor.BLACK),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text('7')),
                              );
                            },
                          ),
                        ),
                        // DIVIDER
                        Divider(color: Colors.grey[300]),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.019,
                        ),
                        // DESCRIPTION
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: Text(
                            "Adidas Running Shoes With Cooling Ventilation",
                            maxLines: 2,
                            style: TypographyPoppins.displayMedium.copyWith(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.017,
                        ),
                        Text(
                          "Take cool dry on sunny, warmdays. These adidas running shoes have plenty of ventilation",
                          maxLines: 2,

                          overflow: TextOverflow.ellipsis,
                          style: TypographyPoppins.labelSmall.copyWith(
                            color: Appcolor.GREY,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.017,
                        ),
                        solidTextButton(text: "Add to bag"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
