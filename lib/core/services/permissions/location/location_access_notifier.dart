import 'domain/location_access_result.dart';
import 'domain/services/geolocator_access_gateway.dart';
import 'domain/services/geolocator_position_gateway.dart';
import 'domain/services/permisson_settings_opener.dart';
import 'location_access_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationAccessNotifier extends StateNotifier<LocationAccessState> {
  final GeolocatorAccessGateway _access;
  final GeolocatorPositionGateway _position;
  final PermissionSettingsOpener _settings;

  LocationAccessNotifier({
    required GeolocatorAccessGateway access,
    required GeolocatorPositionGateway position,
    required PermissionSettingsOpener settings,
  })  : _access = access,
        _position = position,
        _settings = settings,
        super(const LocationAccessState.loading());

  Future<void> check() async {
    state = const LocationAccessState.checking();
    final result = await _access.check();
    await _apply(result);
  }

  Future<void> request() async {
    state = const LocationAccessState.checking();
    final result = await _access.request();
    await _apply(result);
  }

  Future<void> openNativePermissionSettings() =>
      _settings.openPermissionSettings();

  Future<void> openGpsSettings() => _settings.openGpsSettings();

  Future<void> _apply(LocationAccessResult result) async {
    if (result.isGranted) {
      // final location = await _position.getPosition(localeIdentifier: 'pt_BR');
      // state = LocationAccessState.granted(location);
      state = const LocationAccessState.granted(null);
      return;
    }

    state = switch (result.issue!) {
      LocationAccessIssue.serviceDisabled =>
        const LocationAccessState.serviceDisabled(),
      LocationAccessIssue.denied => const LocationAccessState.denied(),
      LocationAccessIssue.deniedPermanently =>
        const LocationAccessState.deniedPermanently(),
    };
  }

  // Future<void> openNativePermissionSettings(
  //     {String permissionType = 'location'}) async {
  //   try {
  //     // Primeiro tenta usar permission_handler (mais confiável)
  //     await openAppSettings();
  //   } catch (e) {
  //     // Fallback para métodos específicos de plataforma
  //     if (Platform.isAndroid) {
  //       await _openAndroidPermissionSettings();
  //     } else if (Platform.isIOS) {
  //       await _openIOSSettings();
  //     }
  //   }
  // }

  // Future<void> _openAndroidPermissionSettings() async {
  //   try {
  //     // Tenta abrir via URL scheme
  //     final url = Uri.parse('app-settings:');
  //     if (await canLaunchUrl(url)) {
  //       await launchUrl(url);
  //     } else {
  //       // Fallback para intent genérico
  //       await openAppSettings();
  //     }
  //   } catch (e) {
  //     await openAppSettings();
  //   }
  // }

  // Future<void> _openIOSSettings() async {
  //   try {
  //     final url = Uri.parse('app-settings:');
  //     if (await canLaunchUrl(url)) {
  //       await launchUrl(url);
  //     } else {
  //       await openAppSettings();
  //     }
  //   } catch (e) {
  //     await openAppSettings();
  //   }
  // }

  // Future<void> _applyResult(LocationAccessResult result) async {
  //   if (result.isGranted) {
  //     final location =
  //         await _locationProvider.getCurrent(localeIdentifier: 'pt_BR');
  //     state = LocationAccessState.granted(location);
  //     return;
  //   }

  //   switch (result.issue!) {
  //     case LocationAccessIssue.serviceDisabled:
  //       state = const LocationAccessState.serviceDisabled();
  //       return;
  //     case LocationAccessIssue.denied:
  //       state = const LocationAccessState.denied();
  //       return;
  //     case LocationAccessIssue.deniedPermanently:
  //       state = const LocationAccessState.deniedPermanently();
  //       return;
  //   }
  // }
}
