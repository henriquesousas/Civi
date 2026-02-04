import 'package:app_core/src/services/permissions/location/service/get_current_position.dart';
import 'package:app_core/src/services/permissions/location/service/location_access_request.dart';
import 'package:app_core/src/services/permissions/location/location_access_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: verificar se deixo no core ou modulo principal
final locationAccessNotifierProvider =
    StateNotifierProvider<LocationAccessNotifier, LocationAccessState>(
  (ref) => LocationAccessNotifier(),
);

class LocationAccessNotifier extends StateNotifier<LocationAccessState> {
  final LocationAccessRequest _checker;
  final GetCurrentPosition _locationProvider;

  LocationAccessNotifier({
    LocationAccessRequest checker = const LocationAccessRequest(),
    GetCurrentPosition locationProvider = const GetCurrentPosition(),
  })  : _checker = checker,
        _locationProvider = locationProvider,
        super(const LocationAccessState.loading());

  Future<void> check() async {
    state = const LocationAccessState.checking();

    final result = await _checker.check();
    await _applyResult(result);
  }

  Future<void> request() async {
    state = const LocationAccessState.loading();

    final result = await _checker.request();
    await _applyResult(result);
  }

  Future<void> _applyResult(LocationAccessResult result) async {
    if (result.isGranted) {
      final location =
          await _locationProvider.getCurrent(localeIdentifier: 'pt_BR');
      state = LocationAccessState.granted(location);
      return;
    }

    switch (result.issue!) {
      case LocationAccessIssue.serviceDisabled:
        state = const LocationAccessState.serviceDisabled();
        return;
      case LocationAccessIssue.denied:
        state = const LocationAccessState.denied();
        return;
      case LocationAccessIssue.deniedPermanently:
        state = const LocationAccessState.deniedPermanently();
        return;
    }
  }
}
