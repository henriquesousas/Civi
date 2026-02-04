import 'package:app_core/src/utils/collection_utils.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  final double? latitue;
  final double? longitude;
  final String? state;
  final String? city;
  final String? adress;
  CurrentLocation._({
    required this.state,
    required this.city,
    required this.adress,
    required this.latitue,
    required this.longitude,
  });

  static CurrentLocation? from(
    List<Placemark> placemarks,
    Position position,
  ) {
    if (placemarks.isEmpty) return null;
    final state = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks.toList(),
      (e) => e.administrativeArea,
      condiction: (s) => s.isNotEmpty,
    );

    final city = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks.toList(),
      (e) => e.subAdministrativeArea,
      condiction: (s) => s.isNotEmpty,
    );

    final fullAddress = CollectionUtils.firstOrNull<Placemark, String>(
      placemarks.toList(),
      (e) => e.thoroughfare,
      condiction: (s) => s.isNotEmpty,
    );

    if (state == null && city == null) return null;

    return CurrentLocation._(
      latitue: position.latitude,
      longitude: position.longitude,
      state: state,
      city: city,
      adress: fullAddress,
    );
  }
}
