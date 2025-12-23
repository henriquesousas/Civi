import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionNotifier extends StateNotifier<AuthenticatedUser?> {
  SessionNotifier() : super(null);
  void setSession(AuthenticatedUser session) {
    state = session;
  }

  //O certo seria criar um novo método que atualiza apenas o nickname
  void setNickname(String nickname) {
    if (state != null) {
      state = AuthenticatedUser(
        id: state!.id,
        name: state!.name,
        email: state!.email,
        photoUrl: state!.photoUrl,
        nickName: nickname,
      );
    }
  }

  void clearSession() {
    state = null;
  }
}
