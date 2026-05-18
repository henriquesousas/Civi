import 'package:deehelp/old_core/services/permissions/location/domain/current_location.dart';

abstract interface class GeolocatorPositionGateway {
  Future<CurrentLocation?> getPosition({String localeIdentifier});
}
