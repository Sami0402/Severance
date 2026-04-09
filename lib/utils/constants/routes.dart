import 'package:e_commerce_app/modules/Auth/forgotPassword_screen.dart';
import 'package:e_commerce_app/modules/Auth/login_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/main_screen.dart';
import 'package:e_commerce_app/modules/Main%20Screens/product_detail.dart';
import 'package:e_commerce_app/modules/onboard/onboard_screen.dart';
import 'package:e_commerce_app/modules/Auth/register_screen.dart';
import 'package:e_commerce_app/modules/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Routes names
class Routes {
  static const String splashScreen = '/splash_screen';
  static const String onboardScreen = '/onboard_screen';
  static const String loginScreen = '/login_screen';
  static const String forgotPasswordScreen = '/forgotPassword_screen';
  static const String registerScreen = '/register_screen';
  static const String MainScreen = '/home_screen';
  static const String productDetail = '/product_screen';
}

final getPages = [
  GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
  GetPage(name: Routes.onboardScreen, page: () => OnboardScreen()),
  GetPage(name: Routes.loginScreen, page: () => LoginScreen()),
  GetPage(name: Routes.forgotPasswordScreen, page: () => Forgotpassword()),
  GetPage(name: Routes.registerScreen, page: () => RegisterScreen()),
  GetPage(name: Routes.MainScreen, page: () => MainScreen()),
  GetPage(name: Routes.productDetail, page: () => ProductDetail()),
];
