import 'package:deehelp/core/services/network/network_info_provider.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/module/auth/domain/repositories/auth_repository.dart';
import 'package:deehelp/module/external/repositories/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return SupabaseAuthRepository(client: client, networkInfo: networkInfo);
});
