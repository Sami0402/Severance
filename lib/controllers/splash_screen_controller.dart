import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    waitforsec(SplashScreenMs);
  }

  Duration SplashScreenMs = Duration(milliseconds: 2000);

  Future<void> waitforsec(durations) async {
    await Future.delayed(SplashScreenMs);
    Get.toNamed(Routes.onboardScreen);
  }
}
