import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:deehelp/old_core/ui/extensions/result_extension.dart';
import 'package:deehelp/module/auth/external/di/auth_repository_provider.dart';
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
    _listenLocationChanges();
  }

  Future<void> initCheck() async {
    final authenticated = await _checkAuthenticationWithMinSplash();
    if (!authenticated) {
      state = AppStatus.unauthenticated;
      return;
    }

    await _checkLocalization();
  }

  Future<void> refresh() async {
    state = AppStatus.loading;
    await initCheck();
  }

  Future<bool> _checkAuthenticationWithMinSplash() async {
    final start = DateTime.now();

    final authRepo = ref.read(authRepositoryProvider);
    final result = await authRepo.getCurrentUser();

    await _ensureMinSplash(start);
    return result.isSuccess;
  }

  Future<void> _ensureMinSplash(DateTime start) async {
    const minTime = Duration(seconds: 5);
    final elapsed = DateTime.now().difference(start);

    if (elapsed < minTime) {
      await Future.delayed(minTime - elapsed);
    }
  }

  void _listenLocationChanges() {
    ref.listen<LocationAccessState>(
      locationAccessNotifierProvider,
      (_, next) {
        if (state == AppStatus.loading) return;

        next.when(
          loading: () {},
          checking: () {},
          granted: (location) {
            _setCurrentLocation(location);
            state = AppStatus.ready;
          },
          denied: () => state = AppStatus.needLocation,
          deniedPermanently: () => state = AppStatus.needLocation,
          serviceDisabled: () => state = AppStatus.gpsInactive,
        );
      },
    );
  }

  Future<void> _checkLocalization() async {
    final notifier = ref.read(locationAccessNotifierProvider.notifier);

    await notifier.check();

    final locState = ref.read(locationAccessNotifierProvider);

    locState.when(
      loading: () {},
      checking: () {},
      granted: (location) {
        _setCurrentLocation(location);
        state = AppStatus.ready;
      },
      denied: () => state = AppStatus.needLocation,
      deniedPermanently: () => state = AppStatus.needLocation,
      serviceDisabled: () => state = AppStatus.gpsInactive,
    );
  }

  void _setCurrentLocation(CurrentLocation? location) {
    if (location == null) return;
    ref.read(currentLocationProvider.notifier).state = location;
  }
}
