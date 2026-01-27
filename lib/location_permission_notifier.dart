import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

// sealed class LocationStatus {}

// class LocationLoading extends LocationStatus {}

// class LocationGranted extends LocationStatus {}

// class LocationServiceDisabled extends LocationStatus {}

// class LocationPermissionDenied extends LocationStatus {}

// class LocationPermissionPermanentlyDenied extends LocationStatus {}

final locationPermissionProvider =
    StateNotifierProvider<LocationPermissionNotifier, LocationState>(
  (ref) => LocationPermissionNotifier(),
);

class LocationPermissionNotifier extends StateNotifier<LocationState> {
  LocationPermissionNotifier() : super(const LocationState.loading());

  Future<void> check() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = const LocationState.serviceDisabled();
      return;
    }

    final status = await Permission.location.status;

    if (status.isGranted) {
      state = const LocationState.granted();
    } else if (status.isPermanentlyDenied) {
      state = const LocationState.deniedPermanently(
          LocationStatus.permissionDenied, "denied perma");
    } else {
      state =
          const LocationState.denied(LocationStatus.permissionDenied, "denied");
    }
  }

  Future<void> request() async {
    state = const LocationState.loading();

    final status = await Permission.location.request();
    if (status.isGranted) {
      state = const LocationState.granted();
    } else if (status.isPermanentlyDenied) {
      state = const LocationState.deniedPermanently(
          LocationStatus.permissionDenied, "denied perma");
    } else {
      state =
          const LocationState.denied(LocationStatus.permissionDenied, "denied");
    }
  }
}
