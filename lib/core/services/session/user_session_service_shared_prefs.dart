import 'package:deehelp/core/services/session/user_session.dart';
import 'package:deehelp/core/services/session/user_session_service.dart';

class UserSessionServiceSharedPrefs implements UserSessionService {
  @override
  Future<UserSession> load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  void save(UserSession session) {
    // TODO: implement save
  }
}
