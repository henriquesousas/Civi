import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:fpdart/src/task_either.dart';

//TODO: Nao passar String diretamente e sim o IncidentId value obects
class DeleteIncidentUsecase extends OLDUseCase<String, Unit> {
  final IncidentRepository _repository;

  DeleteIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(String incidentId) async {
    return await _repository.delete(incidentId);
  }
}
