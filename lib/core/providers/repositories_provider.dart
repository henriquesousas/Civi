import 'package:deehelp/core/providers/supabase_provider.dart';
import 'package:deehelp/features/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supabaseAuthRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseAuthRepository(client: client);
});
