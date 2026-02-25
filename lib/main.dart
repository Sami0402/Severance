import 'package:e_commerce_app/bindings/home_binding.dart';
import 'package:e_commerce_app/modules/Auth/auth_gate.dart';
import 'package:e_commerce_app/modules/Home/home_screen.dart';
import 'package:e_commerce_app/modules/onboard/onboard_screen.dart';
import 'package:e_commerce_app/modules/splash_screen.dart';
import 'package:e_commerce_app/utils/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Severance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      ),
      initialBinding: HomeBinding(),
      home: AuthGate(),
      getPages: getPages,
    );
  }
}


