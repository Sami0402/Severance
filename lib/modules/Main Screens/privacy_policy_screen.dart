import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Privacy Policy',
                  style: TypographyPoppins.displaySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin: EdgeInsets.symmetric(vertical: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Appcolor.GREY.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut sodales nunc, sed sollicitudin erat. Integer in vehicula dui, lacinia ullamcorper odio. Donec lectus nisi, fringilla vel mattis quis, molestie ut purus. Vestibulum laoreet dignissim mauris ac porttitor. Fusce pretium elit lorem. Fusce convallis turpis vel lectus vehicula egestas. Praesent erat nibh, mattis quis lacinia vel, varius eget arcu. Fusce elementum ante quis elementum placerat. Curabitur a eleifend enim. Proin dui urna, dapibus sit amet consequat eget, egestas at diam. Praesent nunc enim, varius scelerisque malesuada posuere, ornare vel purus. Proin non cursus odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet leo nec massa luctus vulputate. Etiam facilisis pretium tincidunt. Vivamus ac commodo lacus. Ut lacinia tortor sit amet justo commodo tristique. Vestibulum est massa, aliquet sit amet enim a, commodo ultrices velit. Duis fermentum lorem placerat urna condimentum mollis. Duis urna est, blandit et euismod et, tincidunt non lorem. Suspendisse fringilla iaculis elit. In pretium odio ac sollicitudin imperdiet.",
                    style: TypographyPoppins.labelSmall.copyWith(
                      color: Appcolor.BLACK,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
