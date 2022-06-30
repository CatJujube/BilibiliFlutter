import 'package:flutter/material.dart';

class BColor{

  static const Color DEFALUT_TEXT_GRAY = Color(0xFFE0E0E0);
  static const Color DEFALUT_UNDERLINE_GRAY = Color(0xFFE0E0E0);


  static const int _whitePrimaryValue = 0xFFFFFFFF;

  static const MaterialColor materialWhite = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

}