import 'package:deehelp/business/_shared/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:fpdart/src/task_either.dart';

class GetIncidentsUseCase
    extends OLDUseCase<IncidentFilter, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetIncidentsUseCase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<IncidentOutput>>> execute(IncidentFilter filter) async {
    return await _repository.getIncidents(filter);
  }
}
