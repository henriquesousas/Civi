import 'package:deehelp/core/providers/current_location_provider.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:deehelp/core/ui/extensions/result_extension.dart';
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
    final start = DateTime.now();

    // 1️⃣ Check localização
    await ref.read(locationPermissionProvider.notifier).check();
    final locationState = ref.read(locationPermissionProvider);

    // 2️⃣ Check autenticação
    final authRepo = ref.read(authRepositoryProvider) as SupabaseAuthRepository;
    final authResult = await authRepo.getCurrentUser();
    final isAuthenticated = authResult.isSuccess;

    // 3️⃣ Se NÃO estiver autenticado → garantir 3s de splash
    await ellapseTime(start);
    if (!isAuthenticated) {
      state = AppStatus.unauthenticated;
    } else if (!locationState.maybeWhen(
      granted: (currentLocation) {
        ref.watch(currentLocationProvider.notifier).state = currentLocation;
        return true;
      },
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

  Future<void> ellapseTime(DateTime start) async {
    final elapsed = DateTime.now().difference(start);
    const minSplashTime = Duration(seconds: 5);
    if (elapsed < minSplashTime) {
      await Future.delayed(minSplashTime - elapsed);
    }
  }
}
