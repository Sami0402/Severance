import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key,  required this.imageUrl, required this.name, required this.price, required this.category, required this.title, required this.description});

  final String imageUrl;
  final String name;
  final int price;
  final String category;
  final String title;
  final String description;
  // TODO ADD SIZES AND RATING
  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 250, 252),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
              ),
              // PRODUCT IMAGE & CANCEL -- CATEGORY -- FAVOURITE
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.04),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.030,
                      ),
                      height: SizeConfig.screenHeight * 0.32,
                      width: SizeConfig.screenWidth,

                      child: Image.network("http://192.168.1.8:3000/uploads/${imageUrl}", fit: BoxFit.contain),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.028,
                        vertical: SizeConfig.screenHeight * 0.009,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // CANCEL
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: SizeConfig.screenHeight * 0.028,
                            ),
                          ),
                          //CATEGORY
                          // Text(
                          //   "Product Details",
                          //   style: TypographyPoppins.labelSmall,
                          // ),
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
                                      color: Appcolor.BLACK,
                                      size: SizeConfig.screenHeight * 0.028,
                                    )
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.grey[500],
                                      size: SizeConfig.screenHeight * 0.028,
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
                  height: SizeConfig.screenHeight * 0.64,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    color: Appcolor.WHITE,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenHeight * 0.03,
                        ).copyWith(
                          top: SizeConfig.screenHeight * 0.035,
                          bottom: SizeConfig.screenHeight * 0.015,
                        ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SHOE NAME
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: Text(
                              title,
                              style: TypographyPoppins.displayLarge.copyWith(
                                fontSize: SizeConfig.screenHeight * 0.038,
                                height: 1.0,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.015),
                          // SHOW CATEGORY & Rating
                          Row(
                            children: [
                              Text(
                                category,
                                style: TypographyPoppins.labelSmall.copyWith(
                                  color: Appcolor.GREY,
                                  fontSize: SizeConfig.screenHeight * 0.015,
                                ),
                              ),
                              SizedBox(width: 34),
                              RatingBar.readOnly(
                                size: SizeConfig.screenHeight * 0.015,
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
                              SizedBox(width: SizeConfig.screenWidth * 0.01),
                              Text(
                                "4.5",
                                style: TypographyPoppins.labelSmall.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: SizeConfig.screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.015),
                          // PRICE
                          Text(
                            "\$$price",
                            style: TypographyPoppins.displayLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.screenHeight * 0.028,
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.024),
                          // SELECT SIZE
                          Text(
                            "Select Size",
                            style: TypographyPoppins.labelSmall.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.085,
                            width: SizeConfig.screenWidth,

                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.screenWidth * 0.040,
                                  ),
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.050,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.09,
                                  decoration: BoxDecoration(
                                    border: BoxBorder.all(
                                      color: Appcolor.BLACK,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '7',
                                      style: TypographyPoppins.labelSmall
                                          .copyWith(
                                            fontSize:
                                                SizeConfig.screenHeight * 0.018,
                                          ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // DIVIDER
                          Divider(color: Colors.grey.withValues(alpha: 0.15)),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.019,
                          ),
                          // DESCRIPTION
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            child: Text(
                              title,
                              maxLines: 2,
                              style: TypographyPoppins.displayMedium.copyWith(
                                fontSize: SizeConfig.screenHeight * 0.025,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.013,
                          ),
                          Text(
                            description,
                            maxLines: 2,

                            overflow: TextOverflow.ellipsis,
                            style: TypographyPoppins.labelSmall.copyWith(
                              color: Appcolor.GREY,
                              fontSize: SizeConfig.screenHeight * 0.018,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.020,
                          ),
                          solidTextButton(
                            onPressed: (){
                              
                            },
                            text: "Add to bag"),
                        ],
                      ),
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
