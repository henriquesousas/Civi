import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';

abstract class IncidentRepository {
  Future<Result<Unit>> save(Incident incident);
}
