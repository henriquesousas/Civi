import 'dart:ui';

import 'package:deehelp/core/resources/strings/pt_br.dart';
import 'package:deehelp/core/resources/strings/translation.dart';

class R {
  static Translation strings = PtBr();

  static load(Locale locale) {
    strings = PtBr();
    // switch (locale.toString()) {
    //   case "en_US":
    //     strings = EnUs();
    //     break;
    //   default:
    //     strings = PtBr();
    //     break;
    // }
  }
}
