import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class UsernamAndCartIcon extends StatelessWidget {
  const UsernamAndCartIcon({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for shopping',
                style: TypographyPoppins.Regular.copyWith(
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(height: 2),
              Text(
                username,
                style: TypographyPoppins.SemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
