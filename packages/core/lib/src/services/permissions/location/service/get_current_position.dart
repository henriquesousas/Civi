import 'package:app_core/src/services/permissions/location/current_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetCurrentPosition {
  const GetCurrentPosition();

  Future<CurrentLocation?> getCurrent({
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
