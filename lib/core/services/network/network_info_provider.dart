import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deehelp/core/services/network/network_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _connectivityProvider = Provider((ref) => Connectivity());

final networkInfoProvider = Provider(
  (ref) => NetworkInfo(ref.watch(_connectivityProvider)),
);

final connectionStatusProvider = StreamProvider<bool>((ref) {
  final network = ref.watch(networkInfoProvider);

  return network.onConnectionChanged;
});
