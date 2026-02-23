import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';

abstract class IncidentRepository {
  Future<Result<Unit>> save(Incident incident);
  Future<Result<Unit>> update(String incidentId, UpdateIncidentDto dto);
  Future<Result<Unit>> delete(String incidentId);
  Future<Result<List<IncidentOutput>>> getUserIncidents(
    String userId, {
    IncidentStatus? status,
  });
  Future<Result<List<IncidentOutput>>> getRecentIncidentsBylocation(
    String locationame,
    int limit,
  );
  Future<Result<List<IncidentOutput>>> getIncidents(IncidentFilter filter);
}
