import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionNotifier extends StateNotifier<AuthenticatedUser?> {
  SessionNotifier() : super(null);
  void setSession(AuthenticatedUser session) {
    state = session;
  }

  void clearSession() {
    state = null;
  }
}
