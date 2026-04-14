import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/models/shoe_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
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

  final RxBool isLoading = true.obs;

  final RxList<Data> shoeList = <Data>[].obs;

  void fetchAllShoes() async{
    try{
      isLoading(true);
      var result = await ApiService.getAllShoes();

      ShoeModel model = ShoeModel.fromJson(result);

      List<Data> shoes = model.data!;

      shoeList.value = shoes;
      
        
      //   var shoes = data.map( (e)=> ShoeModel(
          
      //     data: [
      //        id: e["id"],
      //         name: e["name"],
      //         category: e["category"],
      //         brand: e["brand"],
      //         imageUrl: "http://192.168.1.8:3000/uploads/${e["image"]}",
      //         title: e["title"],
      //         description: e["description"],
      //         sizes:   e["sizes"],
      //     ],
       
      // ),
      //  ).toList();


    } catch (e){
      print(e);
    } finally {
      isLoading(false);
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
    tabController =  TabController(length: 3, vsync: this);   
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
