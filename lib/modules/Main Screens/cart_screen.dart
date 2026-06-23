import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/cartProductCard.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    SizeConfig.init(context);
    final MainScreenController controller = Get.find<MainScreenController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.045,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Cart Products',
                    style: TypographyPoppins.displaySmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),

                // cart items
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final shoe = controller.cartItems[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.025,
                        ),
                        child: CartProductCard(shoe: shoe,),
                      );
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                // Order Summary
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.06,
                    vertical: SizeConfig.screenHeight * 0.03,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Appcolor.WHITE,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ORDER SUMMARY", style: TypographyPoppins.Bold),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal", style: TypographyPoppins.Regular),
                          Text("\$720.00", style: TypographyPoppins.SemiBold),
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
                          Text("\$720.00", style: TypographyPoppins.SemiBold),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                // proceed to checkout Button
                solidTextButton(text: "PROCEED TO CHECKOUT"),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.095),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
