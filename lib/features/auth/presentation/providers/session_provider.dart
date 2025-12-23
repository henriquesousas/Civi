import 'package:deehelp/features/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/features/auth/presentation/providers/session_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSessionProvider =
    StateNotifierProvider<SessionNotifier, AuthenticatedUser?>(
  (ref) => SessionNotifier(),
);
