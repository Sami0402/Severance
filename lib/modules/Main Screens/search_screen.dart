import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/productCard.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    SizeConfig.init(context);

    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      // backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.03,
          ),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              // SEARCH TEXT
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Search',
                  // textAlign: TextAlign.center,
                  style: TypographyPoppins.displaySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),

              // SEARCH BAR & FILTER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.74,
                    child: customTextField(
                      controller: controller.searchQuery,
                      onChanged: (value) =>
                          controller.filterSearch(controller.searchQuery.text),
                      hintText: 'Search...',
                      borderColor: Colors.white,
                      prefixIcon: CupertinoIcons.search,
                      hintStyle: TypographyPoppins.labelSmall,
                      prefixIconSize: SizeConfig.screenHeight * 0.025,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: SizeConfig.screenHeight * 0.4,
                          decoration: BoxDecoration(
                            color: Appcolor.WHITE,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(child: Text('This is a BottomSheet')),
                        ),
                      );
                    },
                    child: Container(
                      height: SizeConfig.screenHeight * 0.076,
                      width: SizeConfig.screenWidth * 0.14,
                      margin: EdgeInsets.all(SizeConfig.screenHeight * 0.005),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.filter_list, color: Appcolor.BLACK),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              // ALL PRODUCTS
              Expanded(
                child: Obx(
                  () => MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: controller.filteredItems.length,
                    mainAxisSpacing: SizeConfig.screenHeight * 0.045,
                    crossAxisSpacing: SizeConfig.screenWidth * 0.049,

                    padding: EdgeInsets.symmetric(
                      // horizontal: SizeConfig.screenWidth * 0.04,
                    ).copyWith(bottom: SizeConfig.screenHeight * 0.03),
                    itemBuilder: (context, index) {
                      final height = (index % 2 == 0)
                          ? MediaQuery.sizeOf(context).height * 0.32
                          : MediaQuery.sizeOf(context).height * 0.35;

                      return ProductCard(
                        height: height,
                        shoe: controller.filteredItems[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
