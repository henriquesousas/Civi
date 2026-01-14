import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/entity/incident_status.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/external/repository/incident_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIncidentRepository extends IncidentRepository {
  static final _table = "incidents";
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
}
