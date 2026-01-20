import 'package:deehelp/core/utils/collection_utils.dart';
import 'package:geocoding/geocoding.dart';

class CurrentLocation {
  final String? state;
  final String? city;
  final String? fullAddress;
  CurrentLocation({
    required this.state,
    required this.city,
    required this.fullAddress,
  });

  static CurrentLocation? from(List<Placemark> placemarks) {
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

    return CurrentLocation(
      state: state,
      city: city,
      fullAddress: fullAddress,
    );
  }
}
