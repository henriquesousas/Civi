import 'dart:io';

import 'package:deehelp/core/errors/network_failure.dart';
import 'package:deehelp/core/errors/unknow_failure.dart';
import 'package:deehelp/core/services/network/network_info.dart';
import 'package:deehelp/module/auth/domain/exceptions/auth_failure.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Result<T>> safeSupabaseCall<T>({
  required NetworkInfo networkInfo,
  required Future<T> Function() call,
}) async {
  try {
    final hasConnection = await networkInfo.hasConnection;
    if (!hasConnection) {
      return Result.failure(const NetworkFailure());
    }

    final result = await call();
    return Result.success(result);
  } on SocketException {
    return Result.failure(const NetworkFailure());
  } on AuthException catch (e) {
    return Result.failure(AuthFailure(e.message));
  } on PostgrestException catch (e) {
    return Result.failure(AuthFailure(e.message));
  } catch (_) {
    return Result.failure(const UnknownFailure());
  }
}
