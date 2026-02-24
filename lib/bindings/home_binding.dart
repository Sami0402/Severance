import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HomeController>(()=> HomeController());
  }
}