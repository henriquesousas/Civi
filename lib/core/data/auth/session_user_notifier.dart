import 'dart:async';

import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/core/data/auth/mapper_logged_user.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sessionUserNotifier = ChangeNotifierProvider<SessionUserNotifier>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SessionUserNotifier(client);
});

class SessionUserNotifier extends ChangeNotifier {
  final SupabaseClient _client;
  late final StreamSubscription _subscription;
  LogguedUser? _user;

  LogguedUser? get user => _user;

  SessionUserNotifier(this._client) {
    final currentUser = _client.auth.currentUser;
    _user = currentUser != null ? MapperLoggedUser.create(currentUser) : null;

    _subscription = _client.auth.onAuthStateChange.listen((data) {
      final user = data.session?.user;

      switch (data.event) {
        case AuthChangeEvent.signedIn:
        case AuthChangeEvent.tokenRefreshed:
        case AuthChangeEvent.userUpdated:
          _user = user != null ? MapperLoggedUser.create(user) : null;
          break;

        case AuthChangeEvent.signedOut:
          _user = null;
          break;

        default:
          break;
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
