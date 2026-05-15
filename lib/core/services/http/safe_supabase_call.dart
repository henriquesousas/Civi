import 'dart:io';

import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/core/services/network/network_info.dart';

Future<T> safeSupabaseCall<T>({
  required NetworkInfo networkInfo,
  required Future<T> Function() call,
}) async {
  try {
    final hasConnection = await networkInfo.hasConnection;
    if (!hasConnection) {
      throw const NetworkFailure();
    }

    return await call();
  } on SocketException {
    throw const NetworkFailure();
  } catch (_) {
    throw const UnexpectedFailure();
  }
}
