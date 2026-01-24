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
import 'package:flutter/material.dart';
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
  Future<Result<List<IncidentOutput>>> getUserIncidents(
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
  Future<Result<List<IncidentOutput>>> getIncidents(
    GetIncidentFilter filter,
  ) async {
    final term = filter.term.trim().toLowerCase();
    final termNoAccents = term.removeAccents();
    final words = termNoAccents.toLowerCase().split(' ');
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

    // Query base
    dynamic query = _supabaseClient
        .from(_table)
        .select("*,product!inner (id,name,code, product_images (*))")
        .eq('visibility', true)
        .eq('status', filter.status.value);

    final isProductCode = _looksLikeProductCode(term);

    if (isProductCode) {
      debugPrint('Filtrando por placa =>  $term');
      query = query.ilike('product.code', '%$term%');
    } else {
      debugPrint(
          'Filtrando por query => state.ilike.%$term%,state.ilike.%$termNoAccents%,$condition,alert_id.ilike.%$term%');
      query = query = query.or(
        "state.ilike.%$term%,state.ilike.%$termNoAccents%,$condition,alert_id.ilike.%$term%",
      );
    }

    if (filter.limit! > 0) {
      query = query.limit(10);
    }

    final List<dynamic> data = await query;

    final incidents = data.isNotEmpty
        ? data.map<IncidentOutput>((dynamic el) {
            // Faz o cast para Map
            final map = el as Map<String, dynamic>;
            return IncidentMapper.fromMap(map);
          }).toList()
        : <IncidentOutput>[];

    return Result.success(incidents);
  }

  @override
  Future<Result<Unit>> delete(String incidentId) async {
    await _supabaseClient.from(_table).delete().eq('id', incidentId);
    return Result.success(const Unit());
  }

  bool _looksLikeProductCode(String term) {
    final cleanTerm = term.replaceAll(RegExp(r'[\s\-_]'), '').toUpperCase();

    // Padrões comuns de códigos:
    // 1. Letras + números (ex: ABC123, DND0171)
    // 2. Padrão específico como "ABC-1234"
    // 3. Contém números e pelo menos uma letra
    //INC202123 nao é uma placa

    final letterNumberPattern = RegExp(r'^[A-Z]+\d+$|^\d+[A-Z]+$');
    final containsNumbers = RegExp(r'\d').hasMatch(cleanTerm);
    final containsLetters = RegExp(r'[A-Z]').hasMatch(cleanTerm);

    return letterNumberPattern.hasMatch(cleanTerm) ||
        (containsNumbers && containsLetters && cleanTerm.length <= 20);
  }
}
