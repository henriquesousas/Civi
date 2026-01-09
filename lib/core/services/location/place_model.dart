import 'package:deehelp/core/utils/collection_utils.dart';
import 'package:geocoding/geocoding.dart';

class Placemodel {
  final String state;
  final String city;
  final String fullAddress;
  Placemodel(
      {required this.state, required this.city, required this.fullAddress});

  factory Placemodel._empty() {
    return Placemodel(state: '', city: '', fullAddress: '');
  }

  factory Placemodel.from(List<Placemark> placemarks) {
    if (placemarks.isEmpty) {
      return Placemodel._empty();
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

    return Placemodel(
      state: state ?? '',
      city: city ?? '',
      fullAddress: fullAddress ?? '',
    );
  }
}
