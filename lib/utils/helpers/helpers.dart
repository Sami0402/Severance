import 'package:e_commerce_app/utils/constants/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {

   static Future<bool?> customFlutterToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Appcolor.GREY,
      textColor: Appcolor.BLACK,
      fontSize: 14.0,
    );
  }
}
