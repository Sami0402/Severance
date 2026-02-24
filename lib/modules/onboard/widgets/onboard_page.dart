import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 250,
            child: SvgPicture.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: 50),
          Text(title, style: TypographyPoppins.SemiBold.copyWith(fontSize: 25)),
          SizedBox(height: 5),
          Text(
            description,
            style: TypographyRoboto.Regular.copyWith(fontSize: 16),

            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
