import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/controllers/main_screen_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    if  (!Get.isRegistered<MainScreenController>()) {
      Get.lazyPut<MainScreenController>(() => MainScreenController());
    } 
    
   if (!Get.isRegistered<AuthController>()) {
     Get.lazyPut<AuthController>(() => AuthController());

   }
  }
}
