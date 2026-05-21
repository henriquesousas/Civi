import 'package:deehelp/business/user/user_datasource.dart';
import 'package:deehelp/business/user/user_notfound_failure.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
import 'package:deehelp/old_core/services/http/safe_supabase_call.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataSourceSupabase implements UserDataSource {
  static final _logger = Logger("UserDataSourceSupabase");
  final SupabaseClient _client;
  final NetworkInfo _networkInfo;

  UserDataSourceSupabase(
      {required SupabaseClient client, required NetworkInfo networkInfo})
      : _networkInfo = networkInfo,
        _client = client;

  @override
  Future<Map<String, dynamic>> getProfile(String userId) {
    _logger.info("Iniciando consulta do profile");
    return safeSupabaseCall(
      networkInfo: _networkInfo,
      call: () async {
        final response = await _client.rpc("profile_fn_get_user", params: {
          "p_user_id": userId,
          "p_status_comment": "visible",
        });
        if (response['status'] == false) {
          throw const UserNotfoundFailure();
        }
        _logger.info("Retorno da consulta do profile => $response");
        return response;
      },
    );
  }
}
