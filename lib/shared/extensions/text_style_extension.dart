import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  static const String _font = "Poppins";

  static const Map<String, FontWeight> _weights = {
    'light': FontWeight.w300,
    'regular': FontWeight.w400,
    'medium': FontWeight.w500,
    'semiBold': FontWeight.w600,
    'bold': FontWeight.w700,
  };

  static const TextStyle _baseStyle = TextStyle(
    fontFamily: _font,
  );

  static final TextStyle textLight = _baseStyle.copyWith(
    fontWeight: _weights['light'],
  );

  static final TextStyle textRegular = _baseStyle.copyWith(
    fontWeight: _weights['regular'],
  );

  static final TextStyle textMedium = _baseStyle.copyWith(
    fontWeight: _weights['medium'],
  );

  static final TextStyle textSemiBold = _baseStyle.copyWith(
    fontWeight: _weights['semiBold'],
  );

  static final TextStyle textBold = _baseStyle.copyWith(
    fontWeight: _weights['bold'],
  );

  TextStyle get smallLight => textLight.copyWith(fontSize: 12);
  TextStyle get smallRegular => textRegular.copyWith(fontSize: 12);
  TextStyle get regularMedium => textMedium.copyWith(fontSize: 14);
  TextStyle get largeBold => textBold.copyWith(fontSize: 20);
  TextStyle get small => textLight.copyWith(fontSize: 12);
  TextStyle get smallMedium => textLight.copyWith(fontSize: 14);
  TextStyle get regular => textRegular.copyWith(fontSize: 14);
  TextStyle get regularLarge => textRegular.copyWith(fontSize: 18);
  TextStyle get mediumSmall => textMedium.copyWith(fontSize: 16);
  TextStyle get medium => textMedium.copyWith(fontSize: 20);
  TextStyle get mediumExtraLarge => textMedium.copyWith(fontSize: 28);
}

extension TextStylesExtension on BuildContext {
  //TODO: Remover
  TextStyles get getTextStyle => TextStyles.instance;

  //TODO: Apagar responsiveText do screensize extension
  double responsiveText2(
    double scaleFactor, {
    double min = 12.0,
    double max = 32.0,
  }) {
    double fontSize = screenWidth * scaleFactor;
    return fontSize.clamp(min, max);
  }

  static const String _font = "Poppins";
  static const TextStyle _baseLight =
      TextStyle(fontFamily: _font, fontWeight: FontWeight.w300);
  static const TextStyle _baseRegular =
      TextStyle(fontFamily: _font, fontWeight: FontWeight.w400);
  static const TextStyle _baseMedium =
      TextStyle(fontFamily: _font, fontWeight: FontWeight.w500);
  static const TextStyle _baseBold =
      TextStyle(fontFamily: _font, fontWeight: FontWeight.w700);

  TextStyle get textSmall {
    return _baseLight.copyWith(
      fontSize: responsiveText2(0.030, min: 10.0, max: 18.0), // ~3.0%
    );
  }

  TextStyle get textSmallLight => textSmall;

  // smallRegular (Peso Regular, 12px)
  TextStyle get textSmallRegular {
    return _baseRegular.copyWith(
      fontSize: responsiveText2(0.030, min: 12.0, max: 18.0), // ~3.0%
    );
  }

  // smallMedium (Peso Light, 14px)
  TextStyle get textSmallMedium {
    return _baseLight.copyWith(
      fontSize: responsiveText2(0.035, min: 14.0, max: 20.0), // ~3.5%
    );
  }

  // regular (Peso Regular, 14px)
  TextStyle get textRegular {
    return _baseRegular.copyWith(
      fontSize: responsiveText2(0.038, min: 14.0, max: 20.0), // ~3.8%
    );
  }

  // mediumSmall (Peso Medium, 16px)
  TextStyle get textMediumSmall {
    return _baseMedium.copyWith(
      fontSize: responsiveText2(0.042, min: 16.0, max: 18.0), // ~4.2%
    );
  }

  // regularLarge / regularMedium (Peso Regular, 18px)
  TextStyle get textRegularLarge {
    return _baseRegular.copyWith(
      fontSize: responsiveText2(0.048, min: 18.0, max: 24.0), // ~4.8%
    );
  }

  TextStyle get textRegularMedium => textRegularLarge;

  // medium (Peso Medium, 20px)
  TextStyle get textMedium {
    return _baseMedium.copyWith(
      fontSize: responsiveText2(0.052, min: 20.0, max: 28.0), // ~5.2%
    );
  }

  // largeBold (Peso Bold, 20px)
  TextStyle get textLargeBold {
    return _baseBold.copyWith(
      fontSize: responsiveText2(0.052, min: 20.0, max: 28.0), // ~5.2%
    );
  }

  // mediumExtraLarge / mediumLarge (Peso Medium, 28px)
  TextStyle get textMediumExtraLarge {
    return _baseMedium.copyWith(
      fontSize: responsiveText2(0.070, min: 24.0, max: 36.0), // ~7.0%
    );
  }

  TextStyle get textMediumLarge => textMediumExtraLarge;
}
