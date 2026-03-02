import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';

class GetUserIncidentsUseCase extends UseCase<String, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetUserIncidentsUseCase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<IncidentOutput>>> execute(String userId) async {
    return await _repository.getUserIncidents(userId);
  }
}
