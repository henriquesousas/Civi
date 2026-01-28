import 'package:deehelp/core/services/location/location_failure.dart';
import 'package:deehelp/core/services/location/current_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

enum LocationStatus {
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  permissionGranted,
  unknown,
}

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  // Método para verificar status atual
  // ========================================================================
  Future<LocationStatus> checkLocationStatus() async {
    try {
      // Verifica se o serviço de localização está ativo
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationStatus.serviceDisabled;
      }

      // Verifica permissões usando Geolocator
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        return LocationStatus.permissionDenied;
      } else if (permission == LocationPermission.deniedForever) {
        return LocationStatus.permissionDeniedForever;
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return LocationStatus.permissionGranted;
      }

      return LocationStatus.unknown;
    } catch (e) {
      return LocationStatus.unknown;
    }
  }

  // Método para solicitar permissão
  Future<LocationStatus> requestLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return LocationStatus.permissionDenied;
      } else if (permission == LocationPermission.deniedForever) {
        return LocationStatus.permissionDeniedForever;
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return LocationStatus.permissionGranted;
      }

      return LocationStatus.unknown;
    } catch (e) {
      return LocationStatus.unknown;
    }
  }

  // Método aprimorado para obter posição atual
  Future<Position> _getCurrentPosition() async {
    LocationStatus status = await checkLocationStatus();

    switch (status) {
      case LocationStatus.serviceDisabled:
        throw const LocationFailure(
          status: LocationStatus.serviceDisabled,
          message:
              'Serviço de localização desativado. Ative nas configurações do dispositivo.',
        );
      case LocationStatus.permissionDenied:
        // Solicita permissão novamente
        LocationStatus newStatus = await requestLocationPermission();
        if (newStatus != LocationStatus.permissionGranted) {
          throw Exception('Permissão de localização negada');
        }
        break;
      case LocationStatus.permissionDeniedForever:
        throw Exception('Permissão negada permanentemente. '
            'Por favor, habilite manualmente nas configurações do app.');
      case LocationStatus.permissionGranted:
        // Tudo ok, pode continuar
        break;
      case LocationStatus.unknown:
        throw Exception(
            'Não foi possível verificar a permissão de localização');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // MÉTODO PRINCIPAL: Abrir tela nativa de configurações
  Future<void> openNativePermissionSettings(
      {String permissionType = 'location'}) async {
    try {
      // Primeiro tenta usar permission_handler (mais confiável)
      await openAppSettings();
    } catch (e) {
      // Fallback para métodos específicos de plataforma
      if (Platform.isAndroid) {
        await _openAndroidPermissionSettings();
      } else if (Platform.isIOS) {
        await _openIOSSettings();
      }
    }
  }

  // Método específico para Android
  Future<void> _openAndroidPermissionSettings() async {
    try {
      // Tenta abrir via URL scheme
      final url = Uri.parse('app-settings:');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        // Fallback para intent genérico
        await openAppSettings();
      }
    } catch (e) {
      await openAppSettings();
    }
  }

  // Método específico para iOS
  Future<void> _openIOSSettings() async {
    try {
      final url = Uri.parse('app-settings:');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        await openAppSettings();
      }
    } catch (e) {
      await openAppSettings();
    }
  }

  // Método para abrir configurações do serviço de localização (GPS)
  Future<void> openLocationServiceSettings() async {
    if (Platform.isAndroid) {
      try {
        // Android: abre configurações de localização
        final url = Uri.parse('android.settings.LOCATION_SOURCE_SETTINGS');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          // Fallback para configurações gerais
          await openAppSettings();
        }
      } catch (e) {
        await openAppSettings();
      }
    } else if (Platform.isIOS) {
      // iOS não tem tela específica, apenas configurações gerais
      await openNativePermissionSettings();
    }
  }

  // Método melhorado para obter local atual com tratamento de erros
  Future<CurrentLocation?> getCurrentLocation() async {
    try {
      // final permission = await requestLocationPermission();
      // if (permission == LocationStatus.permissionDeniedForever ||
      //     permission == LocationStatus.permissionDenied) {
      //   throw LocationFailure(
      //     status: permission,
      //     message: getStatusMessage(permission),
      //   );
      // }

      // if (permission == LocationStatus.permissionGranted) {
      //   LocationStatus status = await checkLocationStatus();
      //   if (status == LocationStatus.serviceDisabled) {
      //     throw LocationFailure(
      //       status: status,
      //       message: getStatusMessage(status),
      //     );
      //   }
      // }
      // LocationStatus status = await checkLocationStatus();
      // if (status == LocationStatus.serviceDisabled) {
      //   throw LocationFailure(
      //     status: status,
      //     message: getStatusMessage(status),
      //   );
      // }

      Position position = await _getCurrentPosition();
      if (position.latitude == 0.0 && position.longitude == 0.0) {
        return null;
      }

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: "pt_BR",
      );

      return CurrentLocation.from(placemarks, position);
    } catch (e) {
      rethrow;
    }
  }

  // Método auxiliar para verificar se precisa abrir configurações
  Future<bool> shouldOpenSettings() async {
    LocationStatus status = await checkLocationStatus();
    return status == LocationStatus.permissionDeniedForever ||
        status == LocationStatus.serviceDisabled;
  }

  // Método para obter status em formato de mensagem amigável
  String getStatusMessage(LocationStatus status) {
    switch (status) {
      case LocationStatus.serviceDisabled:
        return 'Serviço de localização desativado. Ative o GPS nas configurações do dispositivo.';
      case LocationStatus.permissionDeniedForever ||
            LocationStatus.permissionDenied:
        return 'A localização é necessária para o funcionamento do aplicativo.';
      case LocationStatus.permissionGranted:
        return 'Localização ativada.';
      case LocationStatus.unknown:
        return 'Não foi possível verificar o status da localização.';
    }
  }
}
