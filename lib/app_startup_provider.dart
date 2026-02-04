import 'package:app_core/app_core.dart';
import 'package:deehelp/core/ui/extensions/result_extension.dart';
import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
import 'package:deehelp/features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final locationAccessNotifierProvider =
//     StateNotifierProvider<LocationAccessNotifier, LocationAccessState>(
//   (ref) => LocationAccessNotifier(),
// );

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

  AppStartupNotifier(this.ref) : super(AppStatus.loading);

  Future<void> initCheck() async {
    final isAuthenticated = await _checkAuthentication();

    if (!isAuthenticated) {
      state = AppStatus.unauthenticated;
      return;
    }

    _checkLocalization();
  }

  Future<void> refresh() async {
    state = AppStatus.loading;
    await initCheck();
  }

  Future<void> _ellapseTime(DateTime start) async {
    final elapsed = DateTime.now().difference(start);
    const minSplashTime = Duration(seconds: 5);
    if (elapsed < minSplashTime) {
      await Future.delayed(minSplashTime - elapsed);
    }
  }

  Future<bool> _checkAuthentication() async {
    final start = DateTime.now();
    final authRepo = ref.read(authRepositoryProvider) as SupabaseAuthRepository;
    final authResult = await authRepo.getCurrentUser();
    final isAuthenticated = authResult.isSuccess;

    await _ellapseTime(start);

    if (!isAuthenticated) {
      state = AppStatus.unauthenticated;
      return false;
    }

    return true;
  }

  void _checkLocalization() async {
    await ref.read(locationAccessNotifierProvider.notifier).check();
    final locationRequestState = ref.read(locationAccessNotifierProvider);

    final granted = locationRequestState.maybeWhen(
      granted: (currentLocation) {
        ref.watch(currentLocationProvider.notifier).state = currentLocation;
        return true;
      },
      orElse: () => false,
    );

    if (!granted) {
      state =
          locationRequestState == const LocationAccessState.serviceDisabled()
              ? AppStatus.gpsInactive
              : AppStatus.needLocation;

      return;
    }

    state = AppStatus.ready;
  }
}
