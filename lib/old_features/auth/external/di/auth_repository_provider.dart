import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/old_features/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/old_features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseAuthRepository(client: client);
});
