import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/id_utils.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_dto.dart';

class AddIncidentUsecase extends UseCase<AddIncidentDto, Unit> {
  final IncidentRepository _repository;

  AddIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(AddIncidentDto dto) async {
    final incident = Incident(
      id: IdUtils.generate(),
      product: dto.product,
      userId: dto.userId,
      type: dto.type,
      status: dto.status,
      occurredAt: dto.occurredAt,
      occurredAtTime: dto.occurredAtTime,
      howTo: dto.howTo,
      local: dto.local,
      createdAt: DateTime.now(),
    );
    return await _repository.save(incident);
  }
}
