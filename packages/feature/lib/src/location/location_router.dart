import 'package:app_feature/src/location/gps_disabled_page.dart';
import 'package:app_feature/src/location/location_required_page.dart';
import 'package:go_router/go_router.dart';

class LocationRouter {
  static const String gpsDisabled = '/gps-disabled';
  static const String locationDenied = '/location-denied';
  LocationRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: gpsDisabled,
          builder: (_, __) => const GpsDisabledPage(),
        ),
        GoRoute(
          path: locationDenied,
          builder: (_, __) => const LocationRequiredPage(),
        ),
      ];
}
