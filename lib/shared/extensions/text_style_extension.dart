import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  // static const String _lexendLight = "Lexend_Light";
  // static const String _lexendRegular = "Lexend_Regular";
  // static const String _lexendMedium = "Lexend_Medium";
  // static const String _poppins = "Poppins";
  static const String _font = "Poppins";

  static const TextStyle textLight = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textRegular = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textMedium = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.w400,
  );

  TextStyle get small => textLight.copyWith(fontSize: 12);
  TextStyle get smallMedium => textLight.copyWith(fontSize: 14);

  TextStyle get regular => textRegular.copyWith(fontSize: 14);
  TextStyle get regularMedium => textRegular.copyWith(fontSize: 18);

  TextStyle get mediumSmall => textMedium.copyWith(fontSize: 16);
  TextStyle get medium => textMedium.copyWith(fontSize: 20);
  TextStyle get mediumLarge => textMedium.copyWith(fontSize: 28);
}

extension TextStylesExtension on BuildContext {
  TextStyles get getTextStyle => TextStyles.instance;
}
