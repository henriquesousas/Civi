import 'package:deehelp/old_core/base/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';

class GetIncidentsUseCase
    extends UseCase<IncidentFilter, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetIncidentsUseCase({required IncidentRepository repository})
      : _repository = repository;
  @override
  Future<Result<List<IncidentOutput>>> execute(IncidentFilter filter) async {
    return await _repository.getIncidents(filter);
  }
}
