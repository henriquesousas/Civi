import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';

class GetIncidentByUserUseCase extends UseCase<String, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetIncidentByUserUseCase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<IncidentOutput>>> execute(String userId) async {
    return await _repository.getByUser(userId);
  }
}
