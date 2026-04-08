import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Stack(
        children: [
          // TOP IMAGE
          Image.asset(Images.topImage, fit: BoxFit.cover),

          // TITLE
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            child: Text(
              "Athletics Shoes\nCollection",
              style: TypographyPoppins.displayLarge.copyWith(
                color: Appcolor.WHITE,
                fontSize: MediaQuery.sizeOf(context).width * 0.09,
              ),
            ),
          ),

          Column(
            children: [
              // CATEGORY SCROLLER / TabBar
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: MediaQuery.sizeOf(context).height * 0.15,
                ),
                child: TabBar(
                  controller: controller.tabController,
                  labelColor: Appcolor.WHITE,
                  unselectedLabelColor: Appcolor.GREY,
                  labelStyle: TypographyPoppins.displayMedium.copyWith(
                    fontSize: 23,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.only(left: 10),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,

                  isScrollable: true,
                  tabs: [
                    Text("Men Shoes"),
                    Text("Women Shoes"),
                    Text("Kids Shoes"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // TabBarView
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  margin: EdgeInsets.only(top: 20, left: 18),
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // LARGE LIST VIEW
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.40,
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.productDetail);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 18),
                                    width:
                                        MediaQuery.sizeOf(context).height *
                                        0.30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                              ),
                                              child: Image.asset(
                                                Images.sample1,
                                              ),
                                            ),
                                            //
                                            Positioned(
                                              right: 10,
                                              top: 10,
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
                                                          color: Colors.pink,
                                                          size: 24,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color: Appcolor.GREY,
                                                          size: 24,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            // SHOE NAME
                                            Positioned(
                                              bottom: 5,
                                              left: 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                ),
                                                child: SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.6,
                                                  child: Text(
                                                    "Ultraboost Shoes",
                                                    style: TypographyPoppins
                                                        .displayLarge
                                                        .copyWith(height: 0.9),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        // SHOE Cateogry
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15.0,
                                          ),
                                          child: Text(
                                            "Men's Running",
                                            style: TypographyPoppins.labelSmall
                                                .copyWith(color: Appcolor.GREY),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        // SHOE PRICE
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15.0,
                                          ),
                                          child: Text(
                                            "\$180.0",
                                            style: TypographyPoppins
                                                .displayLarge
                                                .copyWith(
                                                  color: Appcolor.GREY,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.030,
                          ),
                          // LATEST SHOES
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest Shoes',
                                style: TypographyPoppins.displayMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Show All',
                                    style: TypographyPoppins.displaySmall
                                        .copyWith(
                                          color: Appcolor.BLACK,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Icon(Icons.arrow_right_outlined, size: 32),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.016,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.14,

                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,

                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 22),

                                  width:
                                      MediaQuery.sizeOf(context).width * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.asset(
                                      Images.sample2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // LARGE LIST VIEW
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.40,
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 18),
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.asset(Images.sample1),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Obx(
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
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color: Appcolor.GREY,
                                                        size: 24,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          // SHOE NAME
                                          Positioned(
                                            bottom: 5,
                                            left: 0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 15.0,
                                              ),
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.6,
                                                child: Text(
                                                  "Ultraboost Shoes",
                                                  style: TypographyPoppins
                                                      .displayLarge
                                                      .copyWith(height: 0.9),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      // SHOE Cateogry
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Text(
                                          "Men's Running",
                                          style: TypographyPoppins.labelSmall
                                              .copyWith(color: Appcolor.GREY),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      // SHOE PRICE
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Text(
                                          "\$180.0",
                                          style: TypographyPoppins.displayLarge
                                              .copyWith(color: Appcolor.GREY),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.030,
                          ),
                          // LATEST SHOES
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest Shoes',
                                style: TypographyPoppins.displayMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Show All',
                                    style: TypographyPoppins.displaySmall
                                        .copyWith(
                                          color: Appcolor.BLACK,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Icon(Icons.arrow_right_outlined, size: 32),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.016,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.14,

                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,

                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 22),

                                  width:
                                      MediaQuery.sizeOf(context).width * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.asset(
                                      Images.sample2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // LARGE LIST VIEW
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.40,
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 18),
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.asset(Images.sample1),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: Obx(
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
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color: Appcolor.GREY,
                                                        size: 24,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          // SHOE NAME
                                          Positioned(
                                            bottom: 5,
                                            left: 0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 15.0,
                                              ),
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.6,
                                                child: Text(
                                                  "Ultraboost Shoes",
                                                  style: TypographyPoppins
                                                      .displayLarge
                                                      .copyWith(height: 0.9),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      // SHOE Cateogry
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Text(
                                          "Men's Running",
                                          style: TypographyPoppins.labelSmall
                                              .copyWith(color: Appcolor.GREY),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      // SHOE PRICE
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Text(
                                          "\$180.0",
                                          style: TypographyPoppins.displayLarge
                                              .copyWith(color: Appcolor.GREY),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.030,
                          ),
                          // LATEST SHOES
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest Shoes',
                                style: TypographyPoppins.displayMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Show All',
                                    style: TypographyPoppins.displaySmall
                                        .copyWith(
                                          color: Appcolor.BLACK,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Icon(Icons.arrow_right_outlined, size: 32),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.016,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.14,

                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,

                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 22),

                                  width:
                                      MediaQuery.sizeOf(context).width * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.asset(
                                      Images.sample2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
