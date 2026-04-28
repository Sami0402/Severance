import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

class MainScreenController extends GetxController
    with GetTickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController searchQuery = TextEditingController();

  // FOR PHYSICAL DEVICE
  // final String url = "http://192.168.1.100:3000/uploads/";
  // FOR EMULATOR
  final String url = "http://10.0.2.2:3000/uploads/";

  // BottomNavBar
  final PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    if (index != 1) {
      searchQuery.clear();
      filteredItems.assignAll(shoeList);
    }
    selectedIndex.value = index;
  }

  void nextPage(index) {
    pageController.jumpToPage(index);
  }

  // HOMESCREEN -----------------
  // TabBarView on HomeScreen
  late TabController tabController;

  RxBool isLiked = false.obs;

  final RxBool isLoading = true.obs;

  // ALL SHOES
  final RxList<Data> shoeList = <Data>[].obs;

  final List<Data> menShoes = [];
  final List<Data> womenShoes = [];
  final List<Data> kidsShoes = [];

  void fetchAllShoes() async {
    try {
      isLoading(true);
      var result = await ApiService.getAllShoes();

      ShoeModel model = ShoeModel.fromJson(result);

      List<Data> shoes = model.data!;

      shoeList.value = shoes;

      menShoes.addAll(shoeList.where((shoe) => shoe.category == "Men"));
      womenShoes.addAll(shoeList.where((shoe) => shoe.category == "Women"));
      kidsShoes.addAll(shoeList.where((shoe) => shoe.category == "Kids"));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void toggleLike(Data shoe) {
    shoe.isLiked.value = !shoe.isLiked.value;
  }

  // SEARCH FUNCTION
  final RxList filteredItems = [].obs;

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(shoeList);
    } else {
      filteredItems.value = shoeList
          .where(
            (shoe) =>
                shoe.name!.toLowerCase().contains(query.toLowerCase()) ||
                shoe.brand!.toLowerCase().contains(query.toLowerCase()) ||
                shoe.category!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }

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
    fetchAllShoes();
    filteredItems.assignAll(shoeList);
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    pageController.dispose();
    filteredItems.clear();
    super.onClose();
  }
}
