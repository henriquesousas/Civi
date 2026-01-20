import 'package:deehelp/core/providers/location_event_provider.dart';
import 'package:deehelp/core/services/location/events/location_service_event.dart';
import 'package:deehelp/core/services/location/location_failure.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationNotifier extends StateNotifier<LocationState> {
  final Ref _ref;
  final LocationService _locationService;

  LocationNotifier({
    required LocationService service,
    required Ref ref,
  })  : _locationService = service,
        _ref = ref,
        super(LocationState.initial()) {
    getCurrentLocation();
  }

  Future<void> openNativePermissionSettings() async {
    await _locationService.openNativePermissionSettings();
  }

  Future<void> getCurrentLocation() async {
    state = state.copyWith(isLoading: true);
    try {
      final currentLocation = await _locationService.getCurrentLocation();
      _emitEvent(LocationServiceEvent.success(currentLocation));
    } catch (error) {
      if (error is LocationFailure) {
        _emitEvent(
            LocationServiceEvent.error(error.status, error.message, "any"));
      }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void _emitEvent(LocationServiceEvent event) {
    _ref.read(locationServiceEventProvider.notifier).state = event;
  }
}
