import '../domain/location_access_result.dart';
import '../domain/services/geolocator_access_gateway.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DefaultGeolocatorAccessGateway implements GeolocatorAccessGateway {
  @override
  Future<LocationAccessResult> check() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return const LocationAccessResult.failed(
          LocationAccessIssue.serviceDisabled);
    }
    final status = await Permission.location.status;
    return _map(status);
  }

  @override
  Future<LocationAccessResult> request() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return const LocationAccessResult.failed(
          LocationAccessIssue.serviceDisabled);
    }
    final status = await Permission.location.request();
    return _map(status);
  }

  LocationAccessResult _map(PermissionStatus status) {
    if (status.isGranted) return const LocationAccessResult.granted();
    if (status.isPermanentlyDenied) {
      return const LocationAccessResult.failed(
          LocationAccessIssue.deniedPermanently);
    }
    return const LocationAccessResult.failed(LocationAccessIssue.denied);
  }
}
