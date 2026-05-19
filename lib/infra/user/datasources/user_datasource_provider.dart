import 'package:deehelp/business/user/user_datasource.dart';
import 'package:deehelp/infra/user/datasources/user_datasource_supabase.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_datasource_provider.g.dart';

@riverpod
UserDataSource userDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return UserDataSourceSupabase(
    client: client,
    networkInfo: networkInfo,
  );
}
