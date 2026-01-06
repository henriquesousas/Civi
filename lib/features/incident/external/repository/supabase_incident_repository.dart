import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/external/repository/incident_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIncidentRepository extends IncidentRepository {
  static final _table = "incidents";
  final SupabaseClient _supabaseClient;

  SupabaseIncidentRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<Result<Unit>> save(Incident incident) async {
    final map = IncidentModel.toMap(incident);
    await _supabaseClient.from(_table).insert(map);
    return Result.success(const Unit());
  }
}
