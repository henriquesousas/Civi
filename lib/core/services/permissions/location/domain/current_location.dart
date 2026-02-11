import 'package:deehelp/core/utils/collection_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  final double latitude;
  final double longitude;
  final String? state;
  final String? city;
  final String? address;

  const CurrentLocation._({
    required this.latitude,
    required this.longitude,
    required this.state,
    required this.city,
    required this.address,
  });

  static CurrentLocation? from(
    List<Placemark> placemarks,
    Position position,
  ) {
    if (placemarks.isEmpty) return null;

    final state = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks,
      (e) => e.administrativeArea,
      condiction: (s) => s.isNotEmpty,
    );

    final city = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks,
      (e) => e.subAdministrativeArea ?? e.locality ?? '',
      condiction: (s) => s.isNotEmpty,
    );

    final street = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks,
      (e) => e.thoroughfare,
      condiction: (s) => s.isNotEmpty,
    );

    final number = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks,
      (e) => e.subThoroughfare,
      condiction: (s) => s.isNotEmpty,
    );

    final address = [
      if (street != null) street,
      if (number != null) number,
    ].join(', ').trim();

    if (state == null && city == null) return null;

    return CurrentLocation._(
      latitude: position.latitude,
      longitude: position.longitude,
      state: state,
      city: city,
      address: address.isEmpty ? null : address,
    );
  }
}
