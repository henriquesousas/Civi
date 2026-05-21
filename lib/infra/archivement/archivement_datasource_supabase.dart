import 'package:deehelp/business/archivement/archivement_datasource.dart';
import 'package:deehelp/infra/_shared/connectivity/network_info.dart';
import 'package:deehelp/old_core/services/http/safe_supabase_call.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ArchivementDatasourceSupabase implements ArchivementDatasource {
  static final _logger = Logger("ArchivementDatasourceSupabase");
  final SupabaseClient _client;
  final NetworkInfo _networkInfo;

  ArchivementDatasourceSupabase({
    required SupabaseClient client,
    required NetworkInfo networkInfo,
  }) : _networkInfo = networkInfo,
       _client = client;

  @override
  Future<List<Map<String, dynamic>>?> getArchivements() {
    _logger.info("Iniciando consulta das conquistas");
    return safeSupabaseCall(
      networkInfo: _networkInfo,
      call: () async {
        final data = await _client
            .from("archivement")
            .select()
            .eq('visibility', true)
            .order('order', ascending: true);
        return data;
      },
    );
  }
}
