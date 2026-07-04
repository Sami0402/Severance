import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/cartProductCard.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/order_summary.dart';
import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:e_commerce_app/widgets/solidTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    SizeConfig.init(context);
    final MainScreenController controller = Get.find<MainScreenController>();

    Widget showCartItems() {
      if (controller.cartItems.isEmpty) {
        return Container(
          height: 180,
          margin: EdgeInsets.only(top: 200),

          child: Image.asset(Images.emptyCart, fit: BoxFit.contain),
        );
      } else {
        return SizedBox(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final shoe = controller.cartItems[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.025,
                    ),
                    child: CartProductCard(shoe: shoe),
                  );
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              // Order Summary
              OrderSummary(controller: controller),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
              // proceed to checkout Button
              solidTextButton(
                text: "PROCEED TO CHECKOUT",
                onPressed: () => Get.toNamed(Routes.purchased),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.095),
            ],
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
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
                Obx(() => showCartItems()),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
