import 'package:deehelp/business/auth/auth_datasource.dart';
import 'package:deehelp/infra/auth/auth_datasource_supabase.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/old_core/services/network/network_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_datasource_provider.g.dart';

@riverpod
AuthDataSource authDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return AuthDataSourceSupabase(
    client: client,
    networkInfo: networkInfo,
  );
}
