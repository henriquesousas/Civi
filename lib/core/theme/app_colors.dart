import 'package:flutter/material.dart';

class AppColors {
  // static const Color primaryColor = Color(0xFF6C5CE7);
  // static const Color primaryColorDark = Color(0xFF5A4FCF);
  static const Color primaryColor = Color(0xFF2B5BEE);
  static const Color secondaryColor = Color(0xFFEEBE2B);
  static const Color primaryColorDark = Color(0xFF2157F8);
  static const MaterialColor primaryMaterialColor =
      MaterialColor(0xFF9581FF, <int, Color>{
    50: Color(0xFFEFECFF),
    100: Color(0xFFD7D0FF),
    200: Color(0xFFBDB0FF),
    300: Color(0xFFA390FF),
    400: Color(0xFF8F79FF),
    500: Color(0xFF7B61FF),
    600: Color(0xFF7359FF),
    700: Color(0xFF684FFF),
    800: Color(0xFF5E45FF),
    900: Color(0xFF6C56DD),
  });

  static const Color blackColor = Color(0xFF16161E);
  static const Color blackColor80 = Color(0xFF45454B);
  static const Color blackColor60 = Color(0xFF737378);
  static const Color blackColor40 = Color(0xFFA2A2A5);
  static const Color blackColor20 = Color(0xFFD0D0D2);
  static const Color blackColor10 = Color(0xFFE8E8E9);
  static const Color blackColor5 = Color(0xFFF3F3F4);

  static const Color greyColor = Color(0xFFB8B5C3);
  static const Color lightGreyColor = Color(0xFFF8F8F9);
  static const Color lightGreyColor20 = Color(0xFFdfdfe0);
  static const Color lightGreyColor30 = Color(0xFFebebec);
  static const Color darkGreyColor10 = Color(0xFF6B7280);
  static const Color darkGreyColor = Color(0xFF1C1C25);

  static const Color whiteColor = Colors.white;
  static const Color whileColor80 = Color(0xFFCCCCCC);
  static const Color whileColor60 = Color(0xFF999999);
  static const Color whileColor40 = Color(0xFF666666);
  static const Color whileColor20 = Color(0xFF333333);
  static const Color whileColor10 = Color(0xFF191919);
  static const Color whileColor5 = Color(0xFF0D0D0D);

  static const Color purpleColor = Color(0xFF7B61FF);
  static const Color successColor = Color(0xFF2ED573);
  static const Color warningColor = Color(0xFFFFBE21);
  static const Color errorColor = Color(0xFFEA5B5B);
  static const Color errorColorDark = Color(0xFFe13535);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color background = Color(0xFFF8F9FA);
  static const Color blue = Color(0xFF1E3A8A);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      primaryMaterialColor,
    ],
  );
}
