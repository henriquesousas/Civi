import 'package:flutter/material.dart';

class AppColorsV2 {
  // Primary Brand Colors
  static const Color primary = Color(0xFF6C5CE7); // Modern Purple
  static const Color primaryLight = Color(0xFF8E7BF0); // Light Purple
  static const Color primaryDark = Color(0xFF5A4FCF); // Dark Purple

  // Secondary Colors
  static const Color secondary = Color(0xFF00D4B4); // Teal Green
  static const Color secondaryLight = Color(0xFF33E0C7); // Light Teal
  static const Color secondaryDark = Color(0xFF00B89E); // Dark Teal

  // Accent Colors
  static const Color accent = Color(0xFFFF6B9D); // Pink Accent
  static const Color accentLight = Color(0xFFFF8FB3); // Light Pink
  static const Color accentDark = Color(0xFFE55A8A); // Dark Pink

  // Neutral Colors
  static const Color background = Color(0xFFF8F9FA); // Off-white Background
  static const Color surface = Color(0xFFFFFFFF); // Pure White
  static const Color surfaceVariant = Color(0xFFF1F3F4); // Light Gray Surface

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A); // Dark Gray
  static const Color textSecondary = Color(0xFF6C757D); // Medium Gray
  static const Color textTertiary = Color(0xFF9EA3A8); // Light Gray
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White on Primary

  // Semantic Colors
  static const Color success = Color(0xFF28A745); // Green
  static const Color successLight = Color(0xFF4CAF50); // Light Green
  static const Color warning = Color(0xFFFF9500); // Orange
  static const Color warningLight = Color(0xFFFFA726); // Light Orange
  static const Color error = Color(0xFFDC3545); // Red
  static const Color errorLight = Color(0xFFF44336); // Light Red
  static const Color info = Color(0xFF007BFF); // Blue
  static const Color infoLight = Color(0xFF2196F3); // Light Blue

  // Border and Divider Colors
  static const Color border = Color(0xFFE9ECEF); // Light Border
  static const Color borderDark = Color(0xFFDEE2E6); // Medium Border
  static const Color divider = Color(0xFFF1F3F4); // Subtle Divider

  // Shadow Colors
  static const Color shadow = Color(0x1A000000); // 10% Black
  static const Color shadowLight = Color(0x0D000000); // 5% Black
  static const Color shadowDark = Color(0x26000000); // 15% Black
  static const Color iconWarning = Color(0xFFb96902); // 15% Black

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      secondary,
      secondaryLight,
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accent,
      accentLight,
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF8F9FA),
      Color(0xFFFFFFFF),
    ],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primary,
      primaryLight,
    ],
  );

  static LinearGradient primaryGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primary.withValues(alpha: 0.2),
      primaryLight.withValues(alpha: 0.2),
    ],
  );

  static LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Colors.grey.shade100,
    ],
  );

  /// OLD Version
  ///Light Version
  static const Color primaryColor = Color(0XFF212121);
  static const Color backgroundColor = Color(0XFFFAFAFA);
  static const Color buttonBackgroundColor = Color(0XFF101010);
  static const Color buttonTextColor = Color(0XFFFFFFFF);
  static const Color containerBackgroundColor = Color(0XFFFFFFFF);
  static const Color secondaryColor = Color(0XFFFFFFFF);

  static const Color lineColor = Color(0XFFE9E9E9);
  static const Color textColor = Color(0XFF616161);

  static const Color dotIndicatorColor = Color(0XFFE2E2E2);
  static const Color buttonDisableColor = Color(0XFFD4D4D4);
  static const Color textLightColor = Color(0XFF7D7D7D);
  static const Color appBarColor = Color(0XFFF9F9F9);
  static const Color containerColor = Color(0XFFEDEDED);
  static const Color reviewFillColor = Color(0XFFD9D9D9);
  static const Color modeInactiveColor = Color(0XFFAFAFAF);
  static const Color bottomIconColor = Color(0XFFD3D3D3);
  static const Color unRatedColor = Color(0XFF6B6B6B);

  ///Dark Version
  static const Color primaryDarkColor = Color(0XFFFFFFFF);
  static const Color secondaryDarkColor = Color(0XFF212121);
  static const Color lineDarkColor = Color(0XFF303030);
  static const Color lineDarkColor2 = Color(0XFFCDCDCD);
  static const Color textDarkColor = Color(0XFFAFAFAF);
  static const Color backgroundDarkColor = Color(0XFF101010);
  static const Color buttonDarkColor = Color(0XFFFAFAFA);
  static const Color containerDarkColor = Color(0XFF1F1F1F);
  static const Color textDark2Color = Color(0XFFDAD9D9);

  ///Other Colors
  static const Color blackColor = Colors.black;
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;
  static const Color blueColor = Colors.blue;
  static const Color yellowColor = Colors.yellow;
  static const Color greyColor = Colors.grey;
  static const Color purpleColor = Colors.purple;
  static const Color pinkColor = Colors.pink;
  static const Color cyanColor = Colors.cyan;
  static const Color greenAccentColor = Colors.greenAccent;
  static const Color indigoColor = Colors.indigo;
  static const Color yellowAccentColor = Colors.yellowAccent;
  static const Color amberColor = Colors.amber;
  static const Color blueGreyColor = Colors.blueGrey;
  static const Color brownColor = Colors.brown;

  //My Colors
  static const Color buttonColor = Color(0XFF3062c8);
  static const Color bottomNavigationBar =
      Color(0XFFFFFFFF); //Color(0XFF212121);
  // static const Color bottomNavigationSelected = Color(0XFF005cf2);
  static const Color bottomNavigationSelected = Color(0XFF3062c8);
  // static const Color bottomNavigationBar = Color(0XFF2dbacc);
}
