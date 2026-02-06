import 'package:app_core/app_core.dart';

abstract interface class GeolocatorPositionGateway {
  Future<CurrentLocation?> getPosition({String localeIdentifier});
}
