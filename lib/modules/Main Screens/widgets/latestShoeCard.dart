import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class LatestShoesCard extends StatelessWidget {
  const LatestShoesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
          right: SizeConfig.screenWidth * 0.042,
          left: SizeConfig.screenWidth * 0.02,
        ),
    
        height: SizeConfig.screenHeight * 0.13,
        width: SizeConfig.screenWidth * 0.235,
        decoration: BoxDecoration(
          color: Colors.white,
    
          borderRadius: BorderRadius.circular(14),
          // color: Appcolor.BLACK,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.05,
              ),
              spreadRadius: 4,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            Images.sample1,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
