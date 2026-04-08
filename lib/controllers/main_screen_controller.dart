import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

class MainScreenController extends GetxController with GetTickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();

  TextEditingController search = TextEditingController();

  // BottomNavBar
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void nextPage(index) {
    pageController.jumpToPage(index);
  }

  // HOMESCREEN -----------------
  // TabBarView on HomeScreen
  late TabController tabController;
  RxBool isLiked = false.obs;


  // Truncate text with specified Max Length
  String truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }

  @override
  void onInit() {
    super.onInit();
    tabController =  TabController(length: 3, vsync: this);
    
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
