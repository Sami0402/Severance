import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {

   static Future<bool?> customFlutterToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.indigoAccent,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
