import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/id_utils.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/entity/incident_status.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_dto.dart';

class AddIncidentImmediatelyUsecase extends UseCase<AddIncidentDto, Unit> {
  final IncidentRepository _repository;

  AddIncidentImmediatelyUsecase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<Unit>> execute(AddIncidentDto dto) async {
    final incident = Incident(
      id: IdUtils.generate(),
      status: IncidentStatus.active,
      type: TypeAlert.immediately,
      product: dto.product,
      userId: dto.userId,
    );
    return await _repository.save(incident);
  }
}
