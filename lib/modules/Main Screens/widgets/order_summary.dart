import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.controller,
  });

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.06,
        vertical: SizeConfig.screenHeight * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Appcolor.WHITE,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ORDER SUMMARY", style: TypographyPoppins.Bold),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TypographyPoppins.Regular),
                // Text("\$720.00", style: TypographyPoppins.SemiBold),
                Text(
                  "\$${controller.orderSummary}.00",
                  style: TypographyPoppins.SemiBold,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping", style: TypographyPoppins.Regular),
                Text("Free", style: TypographyPoppins.SemiBold),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TypographyPoppins.Bold),
                Text(
                  "\$${controller.orderSummary}.00",
                  style: TypographyPoppins.SemiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
