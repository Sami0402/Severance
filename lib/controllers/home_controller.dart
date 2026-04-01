import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {

  final AuthController authController = Get.find<AuthController>();

  TextEditingController search = TextEditingController();
  

  // For Carousel Slider
  RxInt selectedIndex = 0.obs;

  // Carousel Slider Images
  List<String> sliderImages = [Images.b1,Images.b2,Images.b3];

  

  List<CategoryModel> categories = [
    CategoryModel(image: Images.c1, name: 'Sports'),
    CategoryModel(image: Images.c2, name: 'Furniture'),
    CategoryModel(image: Images.c3, name: 'Electronics'),
    CategoryModel(image: Images.c4, name: 'Clothes'),
    CategoryModel(image: Images.c5, name: 'Animals'),
    CategoryModel(image: Images.c6, name: 'Shoes'),
    CategoryModel(image: Images.c7, name: 'Cosmetics'),
    CategoryModel(image: Images.c8, name: 'Jewelery'),
  ];

 // Truncate text with specified Max Length
  String truncateWithEllipsis(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  }
  return '${text.substring(0, maxLength)}...';
}


  
}
