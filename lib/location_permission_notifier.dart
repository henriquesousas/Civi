import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

final locationPermissionProvider =
    StateNotifierProvider<LocationPermissionNotifier, LocationAccessState>(
  (ref) => LocationPermissionNotifier(),
);

class LocationPermissionNotifier extends StateNotifier<LocationAccessState> {
  LocationPermissionNotifier() : super(const LocationAccessState.loading());

  Future<void> check() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = const LocationAccessState.serviceDisabled();
      return;
    }

    final status = await Permission.location.status;

    if (status.isGranted) {
      final currentLocation = await _getCurrentPlace();
      state = LocationAccessState.granted(currentLocation);
    } else if (status.isPermanentlyDenied) {
      state = const LocationAccessState.deniedPermanently();
    } else {
      state = const LocationAccessState.denied();
    }
  }

  Future<void> request() async {
    state = const LocationAccessState.loading();

    final status = await Permission.location.request();
    if (status.isGranted) {
      final currentLocation = await _getCurrentPlace();
      state = LocationAccessState.granted(currentLocation);
    } else if (status.isPermanentlyDenied) {
      state = const LocationAccessState.deniedPermanently();
    } else {
      state = const LocationAccessState.denied();
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
