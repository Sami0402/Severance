import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/productCard.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class ShowAllProduct extends StatelessWidget {
  const ShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<ProductCard> products = [
    //   ProductCard(
    //     image: Images.sample1,
    //     height: SizeConfig.screenHeight * 0.32,
    //   ),
    //   ProductCard(
    //     image: Images.sample6,
    //     height: SizeConfig.screenHeight * 0.35,
    //   ),
    //   ProductCard(
    //     image: Images.sample3,
    //     height: SizeConfig.screenHeight * 0.32,
    //   ),
    //   ProductCard(
    //     image: Images.sample4,
    //     height: SizeConfig.screenHeight * 0.35,
    //   ),
    //   ProductCard(
    //     image: Images.sample5,
    //     height: SizeConfig.screenHeight * 0.32,
    //   ),
    //   ProductCard(
    //     image: Images.sample6,
    //     height: SizeConfig.screenHeight * 0.35,
    //   ),
    // ];
    SizeConfig.init(context);

    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      backgroundColor: Appcolor.WHITE,
      body: SafeArea(
        child: Stack(
          children: [
            // TOP IMAGE
            Image.asset(Images.topImage, fit: BoxFit.cover),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.025,
              ).copyWith(top: SizeConfig.screenHeight * 0.01),
              child: Column(
                children: [
                  // BACK AND FILTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close_rounded, color: Appcolor.WHITE),
                      ),

                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.filter_alt_sharp,
                          color: Appcolor.WHITE,
                        ),
                      ),
                    ],
                  ),
                  // CATEGORY SCROLLER / TabBar
                  Padding(
                    padding: EdgeInsetsGeometry.only(
                      top: SizeConfig.screenHeight * 0.015,
                    ),
                    child: TabBar(
                      controller: controller.tabController,
                      labelColor: Appcolor.WHITE,
                      unselectedLabelColor: Appcolor.GREY,
                      labelStyle: TypographyPoppins.displayMedium.copyWith(
                        fontSize: 20,
                      ),
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.0085,
                      ),
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
                  SizedBox(height: SizeConfig.screenHeight * 0.035),
                  // GRID VIEW
                  Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      itemCount: controller.shoeList.length,
                      mainAxisSpacing: SizeConfig.screenHeight * 0.045,
                      crossAxisSpacing: SizeConfig.screenWidth * 0.049,

                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.03,
                      ).copyWith(bottom: SizeConfig.screenHeight * 0.02),
                      itemBuilder: (context, index) {
                        var shoe = controller.shoeList[index];
                        return ProductCard(
                          height:
                              (index % 5 + 1) *
                              MediaQuery.sizeOf(context).height *
                              0.30,
                          name: shoe.name!,
                          category: shoe.category!,
                          imageUrl: shoe.image!,
                          price: shoe.price!,
                          title: shoe.title!,
                          description: shoe.description!,
                        );
                      },
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
