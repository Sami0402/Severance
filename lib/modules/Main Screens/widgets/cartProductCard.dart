import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Container(
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
                  Text(
                    "Price",
                    style: TypographyPoppins.labelSmall,
                  ),
                ],
              ),
    
              Spacer(),
    
              //INCREAMENT AND DECREAMENT
              Container(
                height: SizeConfig.screenHeight * 0.05,
                // width: SizeConfig.screenWidth * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                      ),
                      Text('1'),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // DELETE
        Positioned(
          right: 3.0,
          top: 0.0,
          child: IconButton(
            splashColor: Colors.grey.shade400,
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.delete_simple,
              size: SizeConfig.screenHeight * 0.022,
            ),
          ),
        ),
      ],
    );
  }
}
