import 'package:deehelp/core/services/location/current_location.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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
      final currentLocation = await _getCurrentPlace();
      state = LocationState.granted(currentLocation);
    } else if (status.isPermanentlyDenied) {
      state = const LocationState.deniedPermanently();
    } else {
      state = const LocationState.denied();
    }
  }

  Future<void> request() async {
    state = const LocationState.loading();

    final status = await Permission.location.request();
    if (status.isGranted) {
      final currentLocation = await _getCurrentPlace();
      state = LocationState.granted(currentLocation);
    } else if (status.isPermanentlyDenied) {
      state = const LocationState.deniedPermanently();
    } else {
      state = const LocationState.denied();
    }
  }

  Future<CurrentLocation?> _getCurrentPlace() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (position.latitude == 0.0 && position.longitude == 0.0) {
        return null;
      }

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: "pt_BR",
      );

      return CurrentLocation.from(placemarks, position);
    } catch (e) {
      return null;
    }
  }
}
