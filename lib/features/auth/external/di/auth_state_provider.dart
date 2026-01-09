import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
import 'package:deehelp/features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateProvider = StreamProvider<Session?>((ref) {
  final repo = ref.watch(authRepositoryProvider) as AuthStateChangeNotifier;
  return repo.onAuthStateChanged();
});
