import 'package:e_commerce_app/bindings/initial_bindings.dart';
import 'package:e_commerce_app/modules/Auth/widgets/auth_gate.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Severance',
      theme: AppTheme.getAppTheme(),
      initialBinding: InitialBindings(),
      home: AuthGate(),
      // initialRoute: Routes.loginScreen,
      getPages: getPages,
    );
  }
}
