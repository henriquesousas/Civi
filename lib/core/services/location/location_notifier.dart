import 'package:deehelp/core/providers/current_location_provider.dart';
import 'package:deehelp/core/providers/location_event_provider.dart';
import 'package:deehelp/core/services/location/current_location.dart';
import 'package:deehelp/core/services/location/events/location_service_event.dart';
import 'package:deehelp/core/services/location/location_failure.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationNotifier extends StateNotifier<LocationState> {
  // bool _initialized = false;
  final Ref _ref;
  final LocationService _locationService;

  LocationNotifier({
    required LocationService service,
    required Ref ref,
  })  : _locationService = service,
        _ref = ref,
        super(const LocationState.loading()) {
    // getCurrentLocation();
    checkLocationStatus();
  }

  Future<void> openNativePermissionSettings() async {
    await _locationService.openNativePermissionSettings();
  }

  Future<void> checkLocationStatus() async {
    // state = const LocationState.loading();
    final event = const LocationServiceEvent.locationRequired(
        LocationStatus.permissionDenied, "");
    _emitEvent(event);
    final status = await _locationService.checkLocationStatus();

    if (status != LocationStatus.permissionGranted) {
      final message = _locationService.getStatusMessage(status);
      state = LocationState.denied(status, message);
      // final event = LocationServiceEvent.error(status, message);
      // _emitEvent(event);
      return;
    }

    state = const LocationState.granted();
    // Se GPS está OK, tenta obter localização
    // await _getCurrentLocation();
  }

  // Future<void> initializeOnce() async {
  //   if (_initialized) return;

  //   _initialized = true;
  //   await getCurrentLocation();
  // }

  Future<void> getCurrentLocation() async {
    try {
      // state = const AsyncLoading();
      state = const LocationState.checking();
      final currentLocation = await _locationService.getCurrentLocation();
      state = const LocationState.granted();
      // state = AsyncData(currentLocation);
      // _emitEvent(LocationServiceEvent.success(currentLocation));
      _notifyCurrentLocationProvider(currentLocation);
    } catch (error) {
      if (error is LocationFailure) {
        // state = AsyncError(error, StackTrace.current);
        state = LocationState.denied(error.status, error.message);
        // _emitEvent(LocationServiceEvent.error(error.status, error.message));
      }
    }
  }

  Future<void> retryCheck() async {
    // await checkLocationStatus();
  }

  void _emitEvent(LocationServiceEvent event) {
    _ref.read(locationServiceEventProvider.notifier).state = event;
  }

  void _notifyCurrentLocationProvider(CurrentLocation? currentLocation) {
    _ref.read(currentLocationProvider.notifier).state = currentLocation;
  }
}
