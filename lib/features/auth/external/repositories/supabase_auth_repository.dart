import 'package:deehelp/core/unit.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/exceptions/unauthenticated_failure.dart';
import 'package:deehelp/features/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/features/auth/domain/exceptions/sign_out_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository extends AuthRepository {
  final SupabaseClient _client;

  SupabaseAuthRepository({required SupabaseClient client}) : _client = client;
  @override
  Future<Result<AuthenticatedUser>> signInWithCredentials(
    String idToken,
    String accessToken,
  ) async {
    final authResponse = await _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final User user = authResponse.user!;
    final session = authResponse.session!;
    final String dysplayName =
        session.user.userMetadata?['full_name']?.toString() ?? '';
    final String? photoUrl = session.user.userMetadata?['picture']?.toString();

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
  Future<Result<AuthenticatedUser>> getCurrentUser() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      return Result.failure(const UnauthenticatedFailure());
    }

    final userId = user.id;
    final name = user.userMetadata?['name'].toString() ?? '';
    final email = user.email ?? '';
    final photoUrl = user.userMetadata?['avatar_url'] as String?;

    final authenticatedUser = AuthenticatedUser(
      id: userId,
      name: name,
      email: email,
      photoUrl: photoUrl,
    );
    return Result.success(authenticatedUser);
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

  // void authEvent() {
  //   _client.auth.onAuthStateChange.listen((data) {
  //     final event = data.event;
  //     final session = data.session;
  //     debugPrint('Auth event: $event, Session: $session');
  //   });
  // }
}
