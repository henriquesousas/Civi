// import 'package:deehelp/core/providers/location_notifier_provider.dart';
// import 'package:deehelp/core/services/location/location_service.dart';
// import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BootstrapResult {
//   final bool isAuthenticated;
//   final LocationStatus? locationStatus;
//   final String? locationMessage;

//   BootstrapResult({
//     required this.isAuthenticated,
//     this.locationStatus,
//     this.locationMessage,
//   });
// }

// final appBootstrapProvider = FutureProvider<BootstrapResult>((ref) async {
//   return await _initializeApp(ref);
// });

// Future<BootstrapResult> _initializeApp(Ref ref) async {
//   try {
//     // 1. Verifica autenticação
//     final authRepository = ref.read(authRepositoryProvider);
//     final session = await authRepository.getCurrentSession();
//     final isAuthenticated = session != null;

//     bool locationGranted = false;
//     LocationStatus? locationStatus;
//     String? locationMessage;

//     // 2. Se autenticado, verifica localização
//     if (isAuthenticated) {
//       final locationService = ref.read(locationServiceProvider);

//       // Verifica status da localização diretamente
//       final status = await locationService.checkLocationStatus();
//       locationStatus = status;
//       locationMessage = locationService.getStatusMessage(status);

//       locationGranted = status == LocationStatus.permissionGranted;

//       // Se permissão concedida, obtém a localização atual
//       if (locationGranted) {
//         final locationNotifier = ref.read(locationNotifierProvider.notifier);
//         await locationNotifier.getCurrentLocation();
//       }
//     }

//     // 3. Aguarda tempo mínimo para splash (opcional)
//     await Future.delayed(const Duration(seconds: 2));

//     return BootstrapResult(
//       isAuthenticated: isAuthenticated,
//       locationGranted: locationGranted,
//       locationStatus: locationStatus,
//       locationMessage: locationMessage,
//     );
//   } catch (error) {
//     return BootstrapResult(
//       isAuthenticated: false,
//       locationGranted: false,
//       error: error.toString(),
//     );
//   }
// }
