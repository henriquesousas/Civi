import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:fpdart/src/task_either.dart';

class UpdateIncidentUsecase extends OLDUseCase<UpdateIncidentDto, Unit> {
  final IncidentRepository _repository;

  UpdateIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(UpdateIncidentDto dto) async {
    return await _repository.update(dto.incidentId, dto);
  }
}
