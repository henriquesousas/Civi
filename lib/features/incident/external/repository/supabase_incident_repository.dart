import 'package:deehelp/core/ui/extensions/string_extension.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_filter.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/features/incident/external/repository/incident_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIncidentRepository extends IncidentRepository {
  // static final _logger = Logger("SupabaseIncidentRepository");
  static final _table = "incidents";
  final SupabaseClient _supabaseClient;

  SupabaseIncidentRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<Result<Unit>> save(Incident incident) async {
    final map = IncidentMapper.toMap(incident);
    await _supabaseClient.from(_table).insert(
          map,
        );
    return Result.success(const Unit());
  }

  @override
  Future<Result<Unit>> update(String incidentId, UpdateIncidentDto dto) async {
    await _supabaseClient.from(_table).update({
      "how_to": dto.howTo,
      "city": dto.city,
      "state": dto.state,
      "approximate_address": dto.address,
      'status': dto.status.name,
      'visibility': dto.visibility,
    }).eq("id", incidentId);
    return Result.success(const Unit());
  }

  @override
  Future<Result<List<IncidentOutput>>> getByUser(
    String userId, {
    IncidentStatus? status,
  }) async {
    final data = await _supabaseClient
        .from(_table)
        .select("*,product (id,name,code, product_images (*))")
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
  Future<Result<List<IncidentOutput>>> getByFilter(
    GetIncidentFilter filter,
  ) async {
    final stateLower = filter.state.toLowerCase();
    final stateNoAccents = stateLower.removeAccents();
    final words = stateNoAccents.toLowerCase().split(' ');
    final condition = words
        .map((word) {
          if (word.length > 2) {
            return "state.ilike.'%$word%'";
          }
          return null;
        })
        .where((cond) => cond != null)
        .toList()
        .join(",");

    dynamic query = _supabaseClient
        .from(_table)
        .select("*,product (id,name,code, product_images (*))")
        .filter('visibility', 'eq', true)
        .filter('status', 'eq', filter.status.value)
        .or("state.ilike.%$stateLower%,state.ilike.%$stateNoAccents%,$condition")
        .order(
          filter.orderBy,
          ascending: filter.direction == SortDirection.asc,
        );

    if (filter.limit != null && filter.limit! > 0) {
      query = query.limit(filter.limit!);
    }

    final data = await query;

    final incidents = data.isNotEmpty
        ? data.map((el) => IncidentMapper.fromMap(el)).toList()
        : [] as List<IncidentOutput>;

    return Result.success(incidents);
  }

  @override
  Future<Result<Unit>> delete(String incidentId) async {
    await _supabaseClient.from(_table).delete().eq('id', incidentId);
    return Result.success(const Unit());
  }
}
