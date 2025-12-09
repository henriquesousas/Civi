import 'package:deehelp/core/services/session/user_session.dart';

abstract class UserSessionService {
  void save(UserSession session);
  Future<UserSession> load();
}
