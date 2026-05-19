import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
import 'package:flutter/material.dart';

import 'dart:async';

// class NetworkAlertController {
//   NetworkAlertController._();

//   static final instance = NetworkAlertController._();

//   final ValueNotifier<bool> notifier = ValueNotifier(false);

//   void showOffline() {
//     notifier.value = true;
//   }

//   void hide() {
//     notifier.value = false;
//   }
// }

class NetworkAlertController {
  NetworkAlertController._();

  static final instance = NetworkAlertController._();

  final ValueNotifier<bool> notifier = ValueNotifier(false);

  bool _wasOffline = false;

  bool get isOffline => notifier.value;

  void showOffline() {
    _wasOffline = true;
    notifier.value = true;
  }

  void hide() {
    notifier.value = false;
  }

  bool consumeReconnectEvent() {
    if (_wasOffline && !notifier.value) {
      _wasOffline = false;
      return true;
    }
    return false;
  }
}

class NetworkReconnectListener {
  final NetworkInfo networkInfo;
  StreamSubscription<bool>? _sub;

  bool _lastConnected = true;

  NetworkReconnectListener(this.networkInfo);

  Future<void> start({
    required Future<void> Function() onReconnect,
    Future<void> Function()? onDisconnect,
  }) async {
    _lastConnected = await networkInfo.hasConnection;

    _sub = networkInfo.onConnectionChanged.listen((connected) async {
      if (_lastConnected == false && connected == true) {
        await onReconnect();
      }

      if (_lastConnected == true && connected == false) {
        if (onDisconnect != null) {
          await onDisconnect();
        }
      }

      _lastConnected = connected;
    });
  }

  void dispose() {
    _sub?.cancel();
  }
}

class NetworkListener {
  final NetworkInfo networkInfo;

  StreamSubscription<bool>? _sub;

  NetworkListener(this.networkInfo);

  Future<void> start() async {
    final hasConnection = await networkInfo.hasConnection;

    if (!hasConnection) {
      NetworkAlertController.instance.showOffline();
    }

    _sub = networkInfo.onConnectionChanged.listen((connected) {
      if (connected) {
        NetworkAlertController.instance.hide();
      } else {
        NetworkAlertController.instance.showOffline();
      }
    });
  }

  void dispose() {
    _sub?.cancel();
  }
}
