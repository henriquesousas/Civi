import 'package:deehelp/core/services/place.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

// enum LocationStatus {
//   serviceDisabled,
//   permissionDenied,
//   permissionDeniedForever,
//   permissionGranted,
//   unknown,
// }

//TODO: Lancar uma sessao especifica com o status da persmissao de localizacao (LocationStatus)
class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está ativo
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Serviço de localização desativado');
    }

    // Verifica permissões
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissão negada permanentemente');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Place?> getCurrentPlace() async {
    try {
      Position position = await LocationService().getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: "pt_BR",
      );
      return Place.from(placemarks);
    } catch (e) {
      return null;
    }
  }
}
