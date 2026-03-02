import '../domain/current_location.dart';
import '../domain/services/geolocator_position_gateway.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class DefaultGeolocatorPositionGateway implements GeolocatorPositionGateway {
  @override
  Future<CurrentLocation?> getPosition({
    String localeIdentifier = 'pt_BR',
  }) async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (position.latitude == 0.0 && position.longitude == 0.0) return null;

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: localeIdentifier,
      );

      return CurrentLocation.from(placemarks, position);
    } catch (_) {
      return null;
    }
  }
}
