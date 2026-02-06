import 'package:app_core/src/services/permissions/location/domain/services/permisson_settings_opener.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DefaultPermissionSettingsOpener implements PermissionSettingsOpener {
  const DefaultPermissionSettingsOpener();

  @override
  Future<void> openPermissionSettings() => openAppSettings();

  @override
  Future<void> openGpsSettings() async =>
      await Geolocator.openLocationSettings();
}
