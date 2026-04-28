import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String POPPINS = 'Poppins';

  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: POPPINS,
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: Appcolor.BLACK,
        ),
        backgroundColor: Appcolor.WHITE,
      ),
      primaryColor: Appcolor.BLACK,
      scaffoldBackgroundColor: Colors.grey[100],

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Appcolor.BLACK),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontFamily: POPPINS, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
