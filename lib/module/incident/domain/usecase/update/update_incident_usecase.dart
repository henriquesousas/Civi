import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';

class UpdateIncidentUsecase extends UseCase<UpdateIncidentDto, Unit> {
  final IncidentRepository _repository;

  UpdateIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(UpdateIncidentDto dto) async {
    return await _repository.update(dto.incidentId, dto);
  }
}
