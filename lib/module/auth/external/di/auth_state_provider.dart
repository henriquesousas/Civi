import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateProvider = StreamProvider<Session?>((ref) {
  // final repo = ref.watch(authRepositoryProvider) as AuthStateChangeNotifier;
  // return repo.onAuthStateChanged();
  throw Exception("AuthStateProvider is not implemented yet");
});
