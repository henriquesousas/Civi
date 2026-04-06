import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/module/incident/external/repository/incident_mapper.dart';
import 'package:deehelp/module/incident/external/repository/region_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIncidentRepository extends IncidentRepository {
  // static final _logger = Logger("SupabaseIncidentRepository");
  // static final _table = "report";
  static final _table = "report_with_coords";
  final SupabaseClient _supabaseClient;

  SupabaseIncidentRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<Result<Unit>> save(Incident incident) async {
    final map = IncidentMapper.toMap(incident);
    await _supabaseClient.from(_table).insert(map);
    return Result.success(const Unit());
  }

  @override
  Future<Result<Unit>> update(String incidentId, UpdateIncidentDto dto) async {
    final updateData = {
      "how_to": dto.howTo,
      "city": dto.city,
      "state": dto.state,
      "address": dto.address,
      'status': dto.status.name,
      // 'visibility': dto.visibility,
    };
    await _supabaseClient.from(_table).update(updateData).eq("id", incidentId);
    return Result.success(const Unit());
  }

  @override
  Future<Result<List<IncidentOutput>>> getUserIncidents(
    String userId, {
    IncidentStatus? status,
  }) async {
    final data = await _supabaseClient
        .from(_table)
        .select(
            "*,product!inner (id,name,code,color, brand, type, obs, product_images (*)),  regions(*)")
        .eq(
          "user_id",
          userId,
        );
    final incidents = data.isNotEmpty
        ? data.map((el) => IncidentMapper.fromMap(el)).toList()
        : [] as List<IncidentOutput>;

    return Result.success(incidents);
  }

  @override
  Future<Result<List<IncidentOutput>>> getIncidents(
    IncidentFilter filter,
  ) async {
    // final term = _normalizeSearchTerm(filter.term);
    // final term = "ABC12";
    debugPrint("Termo filtrado ${filter.term}");

    final data = await _supabaseClient.rpc(
      'search_reports',
      params: {
        'search_term': filter.term,
        'status_value': filter.status.value,
        'limit_value': filter.limit,
        'sort_direction': filter.direction.name,
      },
    );

    // var query = _supabaseClient
    //     .from('report_with_coords')
    //     .select(
    //         "*,product!inner (id,name,code,color, brand, type, obs, product_images (*)),  regions(*)")
    //     .eq('status', filter.status.value);

    // query = query.filter("alert_id", 'ilike', '%$term%').or(
    //       'name.ilike.%$term%,code.ilike.%$term%',
    //       referencedTable: 'product',
    //     );

    // if (filter.mode == SearchMode.incidentCode) {
    //   query = query.filter("alert_id", 'ilike', '%$term%');
    // } else {
    //   if (filter.term != '*') {
    //     debugPrint("Entrou no query ilike $term");
    //     query = query.or(
    //       'name.ilike.%$term%,code.ilike.%$term%',
    //       referencedTable: 'product',
    //     );
    //   }
    // }

    // final data =
    //     await query.limit(filter.limit).order('created_at', ascending: false);

    final incidents = IncidentMapper.toListV2(data);

    return Result.success(incidents);
  }

  @override
  Future<Result<List<IncidentOutput>>> getRecentIncidentsBylocation(
    String city,
    int limit,
  ) async {
    final data = await _supabaseClient.rpc(
      'search_reports',
      params: {
        'search_term': city,
        'status_value': 'active',
        'limit_value': limit,
        'sort_direction': 'asc',
      },
    );

    // final incidents = IncidentMapper.toList(data);
    final incidents = IncidentMapper.toListV2(data);

    return Result.success(incidents);
  }

  @override
  Future<Result<Unit>> delete(String incidentId) async {
    await _supabaseClient.from(_table).delete().eq('id', incidentId);
    return Result.success(const Unit());
  }

  @override
  Future<String?> getRegion(RegionDto dto) async {
    try {
      var query = await _supabaseClient
          .from('regions')
          .select('*')
          .or('name.ilike.%${dto.city}%,region_key.ilike.%${dto.city}%')
          .single();

      return query['id'];
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<IncidentOutput?> getIncidentByProductId(String productId) async {
    try {
      var query = await _supabaseClient
          .from(_table)
          .select(
              "*,product!inner (id,name,code,color, brand, type, obs, product_images (*)),  regions(*)")
          .eq("product_id", productId)
          .single();

      return IncidentMapper.fromMap(query);
    } catch (e) {
      return null;
    }
  }

  // String _normalizeSearchTerm(String term) {
  //   final newTerm = term.trim().toLowerCase();
  //   return newTerm.removeAccents();
  // }

  // String _prepareWordsConditions(String value, String fieldName) {
  //   final words = value.toLowerCase().split(' ');
  //   final conditions = words
  //       .where((word) => word.length > 2)
  //       .map((word) => "$fieldName.ilike.'%$word%'")
  //       .join(",");
  //   return conditions;
  // }
}
