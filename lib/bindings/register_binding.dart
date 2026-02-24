import 'package:e_commerce_app/controllers/Auth_controller/register_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<RegisterController>(()=> RegisterController());
  }
}