// void _handleModal<T>({
//   required BuildContext context,
//   required Widget Function(void Function(T result) onComplete) modalBuilder,
//   required void Function(T result) onComplete,
// }) async {
//   final completer = Completer<T?>();
//   void onResult(T result) {
//     if (!completer.isCompleted) {
//       completer.complete(result);
//       Navigator.of(context).pop();
//     }
//   }

//   customModalBottomSheet(
//     context,
//     child: modalBuilder(onResult),
//   );

//   final T? result = await completer.future;
//   if (result != null) {
//     onComplete(result);
//   }
// }

import 'dart:async';

import 'package:deehelp/old_core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

mixin ModalUtils {
  Future<T?> handleModal<T>({
    required BuildContext context,
    required Widget Function(void Function(T result) onComplete) builder,
    required void Function(T result) onComplete,
  }) async {
    final completer = Completer<T?>();

    void onResult(T result) {
      if (!completer.isCompleted) {
        completer.complete(result);
        Navigator.of(context).pop();
      }
    }

    customModalBottomSheet(
      context,
      child: builder(onResult),
    );

    final T? result = await completer.future;
    if (result != null) {
      onComplete(result);
    }

    return await completer.future;
  }
}
