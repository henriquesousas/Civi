import 'dart:ui';

import 'package:deehelp/old_core/assets/lottie_assets.dart';
import 'package:deehelp/old_core/assets/svg_assets.dart';
import 'package:deehelp/old_core/localization/pt_br.dart';
import 'package:deehelp/old_core/localization/translation.dart';

class R {
  static late Translation _strings;
  static Translation get strings => _strings;
  static SvgAssets svg = SvgAssets();
  static LottieAssets lottie = LottieAssets();

  static void load(Locale locale) {
    switch (locale.languageCode) {
      case "en":
        _strings = PtBr();
        break;
      default:
        _strings = PtBr();
        break;
    }
  }
}
