import 'package:deehelp/old_core/ui/extensions/string_extension.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/module/incident/external/repository/incident_mapper.dart';
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
    final updateData = {
      "how_to": dto.howTo,
      "city": dto.city,
      "state": dto.state,
      "approximate_address": dto.address,
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
            "*,product (id,name,code,color, brand, type, obs, product_images (*))")
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
      IncidentFilter filter) async {
    final term = _normalizeSearchTerm(filter.term);
    var query = _supabaseClient
        .from(_table)
        .select(
            "*,product!inner (id,name,code,color, brand, type, obs, product_images (*))")
        // .eq('visibility', true)
        .eq('status', filter.status.value);

    if (_looksLikeAlertId(term)) {
      query = query.filter("alert_id", 'ilike', '%$term%');
    } else {
      query = query.or(
        'name.ilike.%$term%,code.ilike.%$term%',
        referencedTable: 'product',
      );
    }

    final data = await query.limit(filter.limit);

    final incidents = IncidentMapper.toList(data);

    return Result.success(incidents);
  }

  @override
  Future<Result<List<IncidentOutput>>> getRecentIncidentsBylocation(
    String city,
    int limit,
  ) async {
    String? term;
    String? termWordsCondition;

    if (!city.isNullOrEmpty()) {
      term = _normalizeSearchTerm(city);
      termWordsCondition = _prepareWordsConditions(term, 'city');
    }

    var query = _supabaseClient
        .from(_table)
        .select(
            "*,product!inner (id,name,code,color, brand, type, obs, product_images (*))")
        // .eq('visibility', true)
        .eq('status', IncidentStatus.active.value);

    if (!term.isNullOrEmpty()) {
      query = query.or("city.ilike.%$term%,$termWordsCondition%");
    }

    final data = await query.limit(limit);

    final incidents = IncidentMapper.toList(data);

    return Result.success(incidents);
  }

  @override
  Future<Result<Unit>> delete(String incidentId) async {
    await _supabaseClient.from(_table).delete().eq('id', incidentId);
    return Result.success(const Unit());
  }

  bool _looksLikeAlertId(String term) {
    final cleanTerm = term.replaceAll(RegExp(r'[\s\-_]'), '').toUpperCase();
    final containsNumbers = RegExp(r'\d').hasMatch(cleanTerm);

    return (containsNumbers && cleanTerm.length <= 6);
  }

  String _normalizeSearchTerm(String term) {
    final newTerm = term.trim().toLowerCase();
    return newTerm.removeAccents();
  }

  String _prepareWordsConditions(String value, String fieldName) {
    final words = value.toLowerCase().split(' ');
    final conditions = words
        .where((word) => word.length > 2)
        .map((word) => "$fieldName.ilike.'%$word%'")
        .join(",");
    return conditions;
  }
}
