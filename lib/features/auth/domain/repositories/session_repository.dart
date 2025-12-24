import '../entity/authenticated_user.dart';

abstract class SessionRepository {
  Future<AuthenticatedUser?> getSession();
  Future<void> save(AuthenticatedUser user);
  Future<void> clear();
}
