import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/presentation/auth/providers/auth_repository_provider.dart';
import 'package:deehelp/features/auth/presentation/session/session_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSessionProvider =
    StateNotifierProvider<SessionNotifier, AuthenticatedUser?>(
  (ref) {
    final sessionRepository =
        ref.watch(sharedPreferencesSessionRepositoryProvider);
    return SessionNotifier(sessionRepository: sessionRepository);
  },
);
