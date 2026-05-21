import 'dart:io';

import 'package:deehelp/core/failures/exports.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
import 'package:flutter/widgets.dart';

//TODO: Renomear
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
  } on Failure {
    rethrow;
  } on SocketException {
    throw const NetworkFailure();
  } catch (e) {
    debugPrint("Erro desconhecido: $e");
    throw const UnexpectedFailure();
  }
}
