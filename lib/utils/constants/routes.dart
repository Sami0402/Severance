import 'package:e_commerce_app/modules/Auth/forgotPassword_screen.dart';
import 'package:e_commerce_app/modules/Auth/login_screen.dart';
import 'package:e_commerce_app/modules/Home/home_screen.dart';
import 'package:e_commerce_app/modules/onboard/onboard_screen.dart';
import 'package:e_commerce_app/modules/Auth/register_screen.dart';
import 'package:e_commerce_app/modules/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Routes names
class Routes {
  static String splashScreen = '/splash_screen';
  static String onboardScreen = '/onboard_screen';
  static String loginScreen = '/login_screen';
  static String forgotPasswordScreen = '/forgotPassword_screen';
  static String registerScreen = '/register_screen';
  static String homeScreen = '/home_screen';
}

final getPages = [
  GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
  GetPage(name: Routes.onboardScreen, page: () => OnboardScreen()),
  GetPage(
    name: Routes.loginScreen,
    page: () => LoginScreen(),
  ),
  GetPage(name: Routes.forgotPasswordScreen, page: ()=> Forgotpassword()),
  GetPage(
    name: Routes.registerScreen,
    page: () => RegisterScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => HomeScreen(),
  ),
];
