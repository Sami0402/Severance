import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HomeController>(()=> HomeController());
    Get.put<AuthController>(AuthController());
  }
}