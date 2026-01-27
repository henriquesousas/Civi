// import 'package:deehelp/location_provider.dart';
// import 'package:flutter/material.dart';

import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
import 'package:deehelp/features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:deehelp/location_permission_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppStatus {
  loading,
  unauthenticated,
  needLocation,
  gpsInactive,
  ready,
}

final appStartupProvider = StateNotifierProvider<AppStartupNotifier, AppStatus>(
  (ref) => AppStartupNotifier(ref),
);

class AppStartupNotifier extends StateNotifier<AppStatus> {
  final Ref ref;

  AppStartupNotifier(this.ref) : super(AppStatus.loading) {
    _init();
  }

  Future<void> _init() async {
    await ref.read(locationPermissionProvider.notifier).check();

    final locationState = ref.read(locationPermissionProvider);

    // if (locationState is LocationServiceDisabled) {
    //   state = AppStatus.gpsInactive;
    //   return;
    // }

    // final isAuthenticated = ref.read(authStateProvider).valueOrNull ?? false;
    // final authstate =
    //     ref.watch(authRepositoryProvider) as AuthStateChangeNotifier;
    // final isAuthenticated = authstate.onAuthStateChanged();
    final isAuthenticated = false;

    if (!isAuthenticated) {
      state = AppStatus.unauthenticated;
    } else if (!locationState.maybeWhen(
      granted: () => true,
      orElse: () => false,
    )) {
      state = AppStatus.needLocation;
    } else {
      state = AppStatus.ready;
    }
  }

  Future<void> refresh() async {
    state = AppStatus.loading;
    await _init();
  }
}
