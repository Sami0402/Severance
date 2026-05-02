import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({super.key, required this.controller});

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: SizeConfig.screenHeight * 0.4,
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.all(
              SizeConfig.screenHeight * 0.04,
            ).copyWith(bottom: SizeConfig.screenHeight * 0.07),
            decoration: BoxDecoration(
              color: Appcolor.WHITE,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BRANDS
                  Text("Brands", style: TypographyPoppins.displaySmall),
                  SizedBox(height: SizeConfig.screenHeight * 0.025),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.055,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: SizeConfig.screenWidth * 0.05,
                        mainAxisSpacing: SizeConfig.screenHeight * 0.025,

                        childAspectRatio: 0.68 / 0.38,
                      ),
                      itemCount: controller.brands.length,
                      itemBuilder: (context, index) {
                        final name = controller.brands[index][0];
                        

                        return Obx(() {
                          var isSelected =
                              controller.selectedBrand.value == index;
                          return InkWell(
                            onTap: () {
                              controller.selectedBrand.value = isSelected
                                  ? -1
                                  : index;

                            final brand = isSelected ? null : controller.brands[controller.selectedBrand.value][1];
                            controller.filterbyBrand(brand);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Image.asset(name, fit: BoxFit.fitHeight),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),

                  Spacer(),

                  // PRICE
                  Text("Price", style: TypographyPoppins.displaySmall),
                  SizedBox(height: SizeConfig.screenHeight * 0.019),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${controller.priceRange.value.start.toInt()}",
                        style: TypographyPoppins.Regular,
                      ),
                      Text(
                        "\$${controller.priceRange.value.end.toInt()}",
                        style: TypographyPoppins.Regular,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.015),
                  RangeSlider(
                    padding: EdgeInsets.zero,
                    activeColor: Appcolor.BLACK,
                    inactiveColor: Colors.grey.shade300,
                    overlayColor: WidgetStatePropertyAll(Colors.black45),
                    values: controller.priceRange.value,
                    min: 50,
                    max: 300,
                    onChanged: (range) => controller.filterbyPrice(range),
                  ),

                  // SHOE FOR
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: SizeConfig.screenHeight * 0.061,
        width: SizeConfig.screenWidth * 0.14,
        margin: EdgeInsets.all(SizeConfig.screenHeight * 0.005),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.filter_list, color: Appcolor.BLACK),
      ),
    );
  }
}
