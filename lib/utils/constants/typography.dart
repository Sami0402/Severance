// typography.dart

import 'package:flutter/material.dart';

class TypographyPoppins {
  static const String _FONT_FAMILY = 'Poppins';

  static TextStyle Black =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w900);

  static TextStyle ExtraBold =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w800);

  static TextStyle Bold =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w700);

  static TextStyle SemiBold =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w600);

  static TextStyle Medium =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w500);

  static TextStyle Regular =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w400);

  static TextStyle Thin =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w300);

  static TextStyle Light =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w200);

  static TextStyle ExtraLight =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w100);
}

class TypographyRoboto {
  static const String _FONT_FAMILY = 'Roboto';

  static TextStyle Italic =
      TextStyle(fontFamily: _FONT_FAMILY, fontStyle: FontStyle.italic);

  static TextStyle Regular =
      TextStyle(fontFamily: _FONT_FAMILY, fontStyle: FontStyle.normal);
}