import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';

abstract class IncidentRepository {
  Future<Result<Unit>> save(Incident incident);
  Future<Result<List<IncidentOutput>>> getByUser(
    String userId, {
    IncidentStatus? status,
  });
}
