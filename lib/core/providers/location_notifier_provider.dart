import 'package:deehelp/core/services/location/location_notifier.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationNotifierProvider =
    StateNotifierProvider<LocationNotifier, LocationState>(
  (ref) {
    return LocationNotifier(service: LocationService(), ref: ref);
  },
);
