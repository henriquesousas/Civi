import 'package:deehelp/core/failures/exports.dart';
import 'package:deehelp/ui/_shared/refactor/error_dialog.dart';

extension ErrorFailureTypeMapper on TypeFailure {
  DialogType toDialogType() {
    switch (this) {
      case TypeFailure.network:
        return DialogType.network;
      default:
        return DialogType.error;
    }
  }
}
