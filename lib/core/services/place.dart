import 'package:deehelp/core/utils/collection_utils.dart';
import 'package:geocoding/geocoding.dart';

class Place {
  final String state;
  final String city;
  final String fullAddress;
  Place({required this.state, required this.city, required this.fullAddress});

  factory Place._empty() {
    return Place(state: '', city: '', fullAddress: '');
  }

  factory Place.from(List<Placemark> placemarks) {
    if (placemarks.isEmpty) {
      return Place._empty();
    }
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

    return Place(
      state: state ?? '',
      city: city ?? '',
      fullAddress: fullAddress ?? '',
    );
  }
}
