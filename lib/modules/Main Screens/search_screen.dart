import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/widgets/customNavBar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  'SearchScreen',
                  // style: TypographyPoppins.displayMedium,
                  style: TypographyPoppins.displayMedium.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.5),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
