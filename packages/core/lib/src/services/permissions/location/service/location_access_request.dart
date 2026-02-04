import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

enum LocationAccessIssue {
  serviceDisabled,
  denied,
  deniedPermanently,
}

class LocationAccessResult {
  final bool isGranted;
  final LocationAccessIssue? issue;

  const LocationAccessResult._(this.isGranted, this.issue);

  const LocationAccessResult.granted() : this._(true, null);

  const LocationAccessResult.failed(LocationAccessIssue issue)
      : this._(false, issue);
}

class LocationAccessRequest {
  const LocationAccessRequest();

  Future<LocationAccessResult> check() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const LocationAccessResult.failed(
        LocationAccessIssue.serviceDisabled,
      );
    }

    final status = await Permission.location.status;
    return _mapPermission(status);
  }

  Future<LocationAccessResult> request() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const LocationAccessResult.failed(
          LocationAccessIssue.serviceDisabled);
    }

    final status = await Permission.location.request();
    return _mapPermission(status);
  }

  LocationAccessResult _mapPermission(PermissionStatus status) {
    if (status.isGranted) return const LocationAccessResult.granted();
    if (status.isPermanentlyDenied) {
      return const LocationAccessResult.failed(
        LocationAccessIssue.deniedPermanently,
      );
    }
    return const LocationAccessResult.failed(LocationAccessIssue.denied);
  }
}
