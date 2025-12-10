import 'dart:ui';

import 'package:deehelp/core/ui/assets/svg_assets.dart';
import 'package:deehelp/core/ui/localization/en_us.dart';
import 'package:deehelp/core/ui/localization/pt_br.dart';
import 'package:deehelp/core/ui/localization/translation.dart';

import '../../resources/images/images.dart';

class R {
  static late Translation _strings;
  static Translation get strings => _strings;
  static Images images = Images();
  static SvgAssets svg = SvgAssets();

  static void load(Locale locale) {
    switch (locale.languageCode) {
      case "en":
        _strings = EnUs();
        break;
      default:
        _strings = PtBr();
        break;
    }
  }
}
