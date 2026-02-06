import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF2B5BEE);
  static const Color primaryColorDark = Color(0xFF2157F8);
  static const Color primaryColorVariant = Color(0xFF5F85FF);

  static const Color grey = Color(0xFF6B7280);

  static const shadow = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );

  static const shadowSoft = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  // static const Color white = Color(0xFFFFFFFF);
  // static const MaterialColor primaryMaterialColor =
  //     MaterialColor(0xFF9581FF, <int, Color>{
  //   50: Color(0xFFEFECFF),
  //   100: Color(0xFFD7D0FF),
  //   200: Color(0xFFBDB0FF),
  //   300: Color(0xFFA390FF),
  //   400: Color(0xFF8F79FF),
  //   500: Color(0xFF7B61FF),
  //   600: Color(0xFF7359FF),
  //   700: Color(0xFF684FFF),
  //   800: Color(0xFF5E45FF),
  //   900: Color(0xFF6C56DD),
  // });
}
