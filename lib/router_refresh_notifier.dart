import 'package:deehelp/app_startup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref) {
    ref.listen<AppStatus>(
      appStartupProvider,
      (_, __) => notifyListeners(),
    );
    // ref.listen<LocationAccessState>(
    //   locationAccessNotifierProvider,
    //   (oldState, currentState) {
    //     if (currentState == const LocationAccessState.checking()) return;
    //     if (currentState == const LocationAccessState.loading()) return;
    //     notifyListeners();
    //   },
    // );
  }
}
