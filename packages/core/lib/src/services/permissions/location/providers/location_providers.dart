import 'package:app_core/src/services/permissions/location/domain/current_location.dart';
import 'package:app_core/src/services/permissions/location/domain/services/geolocator_access_gateway.dart';
import 'package:app_core/src/services/permissions/location/domain/services/geolocator_position_gateway.dart';
import 'package:app_core/src/services/permissions/location/domain/services/permisson_settings_opener.dart';
import 'package:app_core/src/services/permissions/location/external/default_geolocator_access_gateway.dart';
import 'package:app_core/src/services/permissions/location/external/default_geolocator_position_gateway.dart';
import 'package:app_core/src/services/permissions/location/external/defaul_permission_settings_opener.dart';
import 'package:app_core/src/services/permissions/location/location_access_notifier.dart';
import 'package:app_core/src/services/permissions/location/location_access_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLocationProvider = StateProvider<CurrentLocation?>((ref) {
  return null;
});

final geolocatorAccessGatewayProvider = Provider<GeolocatorAccessGateway>(
  (_) => DefaultGeolocatorAccessGateway(),
);

final geolocatorPositionGatewayProvider = Provider<GeolocatorPositionGateway>(
  (_) => DefaultGeolocatorPositionGateway(),
);

final permissionSettingsOpenerProvider = Provider<PermissionSettingsOpener>(
  (_) => const DefaultPermissionSettingsOpener(),
);

final locationAccessNotifierProvider =
    StateNotifierProvider<LocationAccessNotifier, LocationAccessState>(
  (ref) => LocationAccessNotifier(
    access: ref.read(geolocatorAccessGatewayProvider),
    position: ref.read(geolocatorPositionGatewayProvider),
    settings: ref.read(permissionSettingsOpenerProvider),
  ),
);
