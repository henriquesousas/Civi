import 'package:deehelp/business/auth/auth_datasource.dart';
import 'package:deehelp/core/data/auth/auth_datasource_supabase.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/old_core/services/network/network_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return AuthDataSourceSupabase(client: client, networkInfo: networkInfo);
});
