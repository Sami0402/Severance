import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:e_commerce_app/modules/Main%20Screens/widgets/favProductCard.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.find<MainScreenController>();

    SizeConfig.init(context);

    Widget showWishlistItems() {
      if (controller.wishlistItems.isEmpty) {
        return Container(
          height: 180,
          margin: EdgeInsets.only(top: 240),
          alignment: Alignment.center,
          width: double.infinity,
          child: Center(
            child: Image.asset(Images.emptyWishlist, fit: BoxFit.scaleDown),
          ),
        );
      } else {
        return SizedBox(
          child: ListView.builder(
            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.wishlistItems.length,

            itemBuilder: (context, index) {
              final shoe = controller.wishlistItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 25, left: 18, right: 18),
                child: FavProductCard(shoe: shoe),
              );
            },
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Favourite Products',
                    style: TypographyPoppins.displaySmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 35),

                // CARDS
                Obx(() => showWishlistItems()),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
