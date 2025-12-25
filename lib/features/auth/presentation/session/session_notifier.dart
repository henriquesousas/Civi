import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/session_repository.dart';

class SessionNotifier extends StateNotifier<AuthenticatedUser?> {
  final SessionRepository _sessionRepository;

  SessionNotifier({
    required SessionRepository sessionRepository,
  })  : _sessionRepository = sessionRepository,
        super(null);

  void setSession(AuthenticatedUser session) async {
    await _sessionRepository.save(session);
    state = session;
  }

  void setNickname(String nickname) async {
    if (state != null) {
      final newAuthenticatedUserInstance = AuthenticatedUser(
        id: state!.id,
        name: state!.name,
        email: state!.email,
        photoUrl: state!.photoUrl,
        authMethod: state!.authMethod,
        nickName: nickname,
      );
      await _sessionRepository.save(newAuthenticatedUserInstance);
      state = newAuthenticatedUserInstance;
    }
  }

  void clearSession() {
    _sessionRepository.clear();
    state = null;
  }
}
