import 'package:deehelp/business/user/usecases/get_profile/user_profile.dart';
import 'package:deehelp/business/user/user_datasource.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
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
  Future<UserProfile> getProfile(String userId) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
}
