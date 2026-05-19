import 'package:deehelp/business/auth/auth_datasource.dart';
import 'package:deehelp/infra/failures/invalid_credentials_failure.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/infra/auth/mapper_logged_user.dart';
import 'package:deehelp/old_core/services/http/safe_supabase_call.dart';
import 'package:deehelp/old_core/services/network/network_info.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

class AuthDataSourceSupabase implements AuthDataSource {
  static final _logger = Logger("AuthDataSourceSupabase");
  final SupabaseClient _client;
  final NetworkInfo _networkInfo;

  AuthDataSourceSupabase({
    required SupabaseClient client,
    required NetworkInfo networkInfo,
  })  : _client = client,
        _networkInfo = networkInfo;

  @override
  Future<LogguedUser> signInWithGoogle(
    String idToken,
    String accessToken,
  ) async {
    return safeSupabaseCall(
      networkInfo: _networkInfo,
      call: () async {
        _logger.info(
            "AuthDataSourceSupabase: Inciando login com Google no Supabase");
        final response = await _client.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );

        final user = response.user;
        if (user == null) {
          throw const InvalidCredentialsFailure();
        }

        _logger.info(
            "AuthDataSourceSupabase: Login com Supabase concluído, mapeando resposta para LoggedUser");
        return MapperLoggedUser.create(user);
      },
    );
  }
}
