import 'package:deehelp/old_core/base/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';

//TODO: Nao passar String diretamente e sim o IncidentId value obects
class DeleteIncidentUsecase extends UseCase<String, Unit> {
  final IncidentRepository _repository;

  DeleteIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(String incidentId) async {
    return await _repository.delete(incidentId);
  }
}
