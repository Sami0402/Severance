import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String _POPPINS = 'Poppins';

  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: _POPPINS,
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: Appcolor.BLACK,
        ),
      ),
      primaryColor: Appcolor.PRIMARY,
      scaffoldBackgroundColor: Appcolor.WHITE,

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: _POPPINS,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Appcolor.BLACK,
        ),
        displaySmall: TextStyle(
          fontFamily: _POPPINS,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Appcolor.BLACK,
        ),
        labelSmall: TextStyle(fontFamily: _POPPINS, color: Appcolor.GREY,),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Appcolor.BLACK),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontFamily: _POPPINS, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
