import 'package:e_commerce_app/utils/constants/assets_constant.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final selectedIndex = 0.obs;
  List<Map<String, dynamic>> onboardContent = [
    {
      "image": Images.onboard1,
      "title": "Choose Your Product",
      "description":
          "welcome to a world of Limitless Choices - Your \n Perfect Product Awaits!",
    },
    {
      "image": Images.onboard2,
      "title": "Select Payment Method",
      "description":
          "For Seamless Transactions, Choose Your Payment \n Path - Your Convenience, Our Priority!",
    },
    {
      "image": Images.onboard3,
      "title": "Deliver At Your Door Step",
      "description":
          "From Our to Yours - Swift, Secure and \n Contactless Delivery",
    },
  ];
}
