import '../location_access_result.dart';

abstract interface class GeolocatorAccessGateway {
  Future<LocationAccessResult> check();
  Future<LocationAccessResult> request();
}
