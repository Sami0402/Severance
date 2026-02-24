import 'package:e_commerce_app/modules/onboard/widgets/Animated_dot.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.sizeOf(context).width * 0.90,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            onPageChanged: (value) {
              controller.selectedIndex.value = value;
            },
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.sizeOf(context).width * 0.82,
                decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(controller.sliderImages[index]),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(right: 5),
                child: AnimatedDot(
                  isActive: controller.selectedIndex.value == index
                      ? true
                      : false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
