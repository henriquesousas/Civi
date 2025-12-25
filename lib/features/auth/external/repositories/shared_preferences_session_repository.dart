import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/domain/repositories/session_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSessionRepository implements SessionRepository {
  final _keyId = "_keyId";
  final _keyName = "_keyName";
  final _keyEmail = "_keyEmail";
  final _keyNickName = "_keyNickName";
  final _keyPhotoUrl = "_keyPhotoUrl";
  final _keyAuthMethod = "_keyAuthMethod";
  @override
  Future<void> clear() async {
    final sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

  @override
  Future<AuthenticatedUser?> getSession() async {
    final sp = await SharedPreferences.getInstance();

    if (sp.getString(_keyId) == null || sp.getString(_keyId)!.isEmpty) {
      return null;
    }

    return AuthenticatedUser(
      id: sp.getString(_keyId)!,
      name: sp.getString(_keyName)!,
      email: sp.getString(_keyEmail)!,
      nickName: sp.getString(_keyNickName),
      photoUrl: sp.getString(_keyPhotoUrl),
      authMethod: AuthMethod.values.firstWhere(
        (e) => e.name == sp.getString(_keyAuthMethod),
        orElse: () => AuthMethod.anonymous,
      ),
    );
  }

  @override
  Future<void> save(AuthenticatedUser user) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_keyId, user.id);
    await sp.setString(_keyName, user.name);
    await sp.setString(_keyEmail, user.email);
    await sp.setString(_keyNickName, user.nickName ?? '');
    await sp.setString(_keyPhotoUrl, user.photoUrl ?? '');
    await sp.setString(_keyAuthMethod, user.authMethod.name);
  }
}
