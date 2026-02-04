import 'package:app_feature/src/gps/gps_disabled_page.dart';
import 'package:app_feature/src/gps/location_access_required_page.dart';
import 'package:go_router/go_router.dart';

class GPSRouter {
  static const String gpsDisabled = '/gps-disabled';
  static const String localizationDenied = '/localization-denied';
  GPSRouter._();

  static List<RouteBase> get routers => [
        GoRoute(
          path: gpsDisabled,
          builder: (_, __) => const GpsDisabledPage(),
        ),
        GoRoute(
          path: localizationDenied,
          builder: (_, __) => const LocationAccessRequiredPage(),
        ),
      ];
}
