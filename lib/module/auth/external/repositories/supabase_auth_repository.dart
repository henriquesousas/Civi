import 'package:deehelp/core/services/http/safe_supabase_call.dart';
import 'package:deehelp/core/services/network/network_info.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/auth/domain/exceptions/unauthenticated_failure.dart';
import 'package:deehelp/module/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/module/auth/domain/exceptions/sign_out_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthStateChangeNotifier {
  Stream<Session?> onAuthStateChanged();
}

class SupabaseAuthRepository
    implements AuthRepository, AuthStateChangeNotifier {
  // static final _logger = Logger("SupabaseAuthRepository");
  final SupabaseClient _client;
  final NetworkInfo _networkInfo;

  SupabaseAuthRepository({
    required SupabaseClient client,
    required NetworkInfo networkInfo,
  })  : _client = client,
        _networkInfo = networkInfo;

  @override
  Future<Result<AuthenticatedUser>> signInWithCredentials(
    String idToken,
    String accessToken,
  ) async {
    return await safeSupabaseCall(
        networkInfo: _networkInfo,
        call: () async {
          final authResponse = await _client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          );

          final User user = authResponse.user!;
          final session = authResponse.session!;
          final String dysplayName =
              session.user.userMetadata?['full_name']?.toString() ?? '';
          final String? photoUrl =
              session.user.userMetadata?['picture']?.toString();

          return AuthenticatedUser(
            id: user.id,
            name: dysplayName,
            email: user.email ?? '',
            photoUrl: photoUrl,
            authMethod: AuthMethod.google,
          );
          // return Result.success(authenticatedUser);
        });
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await _client.auth.signOut();
      return Result.success(const Unit());
    } catch (e) {
      return Result.failure(SignOutFailure(e.toString()));
    }
  }

  @override
  Future<Result<AuthenticatedUser>> getCurrentUser() async {
    final currentUser = _client.auth.currentUser;

    if (currentUser == null) {
      return Result.failure(const UnauthenticatedFailure());
    }

    final User user = currentUser;
    final String dysplayName =
        user.userMetadata?['full_name']?.toString() ?? '';
    final String? photoUrl = user.userMetadata?['picture']?.toString();

    final authenticatedUser = AuthenticatedUser(
      id: user.id,
      name: dysplayName,
      email: user.email ?? '',
      photoUrl: photoUrl,
      authMethod: AuthMethod.google,
    );

    return Result.success(authenticatedUser);
  }

  @override
  Stream<Session?> onAuthStateChanged() {
    return _client.auth.onAuthStateChange.map(
      (event) => event.session,
    );
  }
}
