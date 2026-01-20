import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_filter.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_dto.dart';

abstract class IncidentRepository {
  Future<Result<Unit>> save(Incident incident);
  Future<Result<Unit>> update(String incidentId, UpdateIncidentDto dto);
  Future<Result<Unit>> delete(String incidentId);
  Future<Result<List<IncidentOutput>>> getByUser(
    String userId, {
    IncidentStatus? status,
  });
  Future<Result<List<IncidentOutput>>> getByFilter(GetIncidentFilter filter);
}
