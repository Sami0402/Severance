import 'package:e_commerce_app/modules/Home/widgets/CarouselSlider.dart';
import 'package:e_commerce_app/modules/Home/widgets/PopularCategories.dart';
import 'package:e_commerce_app/modules/Home/widgets/usernameAndCartIcon.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/utils/constants/typography.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Home Controller
    final HomeController controller = Get.find<HomeController>();
    // Retrieve arguments using Get.arguments
    final String? username = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            // USERNAME & CART Icon
            UsernamAndCartIcon(username: username == null ? 'Nothing' : 'username'),
            SizedBox(height: 35),
            // SEARCHBAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: customTextField(
                hintText: 'Search in Store',
                svgPicture: Images.search,
                borderColor: Colors.indigoAccent,
                controller: controller.search,
              ),
            ),
            SizedBox(height: 35),
            // Popular Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Popular Categories',
                style: TypographyPoppins.Medium.copyWith(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
            PopularCategories(controller: controller),
            SizedBox(height: 30),
            // Top Products & Popular Products
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // Top Products
                  CarouselSlider(controller: controller),
                  SizedBox(height: 30),
                  // Popular Products
                  Row(
                    children: [
                      Text(
                        'Popular Products',
                        style: TypographyPoppins.Medium.copyWith(fontSize: 19),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: TypographyPoppins.Regular.copyWith(
                            color: Colors.indigoAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GridView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.80,
                        color: Colors.amber[200],
                        child: Column(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
