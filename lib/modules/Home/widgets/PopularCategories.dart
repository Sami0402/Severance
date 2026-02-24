import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 22.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  margin: EdgeInsets.only(top: 12, right: 15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 10,
                    alignment: Alignment.center,
                    child: Image.asset(
                      controller.categories[index].image,
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Title
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    controller.truncateWithEllipsis(
                      controller.categories[index].name,
                      7,
                    ),
    
                    style: TypographyPoppins.Regular.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

