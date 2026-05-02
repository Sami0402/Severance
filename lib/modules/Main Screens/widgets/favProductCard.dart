import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.16,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.05,
        vertical: SizeConfig.screenHeight * 0.018,
      ),
      decoration: BoxDecoration(
        color: Appcolor.WHITE,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.15,
            width: SizeConfig.screenWidth * 0.24,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.04),

          // NAME CATEGORY PRICE
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TypographyPoppins.displaySmall.copyWith(
                  color: Appcolor.GREY,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.005),
              Text(
                "Men",
                style: TypographyPoppins.labelSmall.copyWith(
                  color: Appcolor.GREY,
                ),
              ),
              SizedBox(height: SizeConfig.screenWidth * 0.020),
              Text("Price", style: TypographyPoppins.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
