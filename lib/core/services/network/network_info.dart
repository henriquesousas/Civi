import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkInfo {
  final Connectivity _connectivity;
  const NetworkInfo(this._connectivity);

  Future<bool> get hasConnection async {
    try {
      final results = await _connectivity.checkConnectivity();
      if (results.isEmpty) return false;
      final hasNetwork =
          results.any((result) => result != ConnectivityResult.none);

      return hasNetwork;
    } on PlatformException {
      return false;
    } catch (_) {
      return false;
    }
  }

  Stream<bool> get onConnectionChanged => _connectivity.onConnectivityChanged
          .map((r) => r != ConnectivityResult.none)
          .handleError((_) {
        // evita quebrar stream caso a plataforma dispare erro
      });
}
