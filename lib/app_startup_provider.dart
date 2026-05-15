import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:deehelp/core/extension/result_extension.dart';
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
    AppStatus? currentStatus;
    // final authenticated = await _checkAuthenticationWithMinSplash();
    // if (!authenticated) {
    //   // state = AppStatus.unauthenticated;
    //   currentStatus = AppStatus.unauthenticated;
    //   // return;
    // }

    // await _checkLocalization(currentStatus);
  }

  Future<void> refresh() async {
    state = AppStatus.loading;
    await initCheck();
  }

  Future<bool> _checkAuthenticationWithMinSplash() async {
    // final start = DateTime.now();

    // final authRepo = ref.read(authRepositoryProvider);
    // final result = await authRepo.getCurrentUser();

    // await _ensureMinSplash(start);
    // return result.isSuccess;
    return false;
  }

  Future<void> _ensureMinSplash(DateTime start) async {
    const minTime = Duration(seconds: 1);
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

  Future<void> _checkLocalization(AppStatus? currentStatus) async {
    final notifier = ref.read(locationAccessNotifierProvider.notifier);

    await notifier.check();

    final locState = ref.read(locationAccessNotifierProvider);

    locState.when(
      loading: () {},
      checking: () {},
      granted: (location) {
        _setCurrentLocation(location);
        if (currentStatus != null) {
          state = currentStatus;
        } else {
          state = AppStatus.ready;
        }
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
