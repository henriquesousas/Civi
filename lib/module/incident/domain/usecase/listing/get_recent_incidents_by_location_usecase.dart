import 'package:deehelp/core/failures/failure.dart';
import 'package:deehelp/business/_shared/use_case.dart';
import 'package:deehelp/old_core/utils/result.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/listing/incident_filter.dart';
import 'package:fpdart/src/task_either.dart';

class GetRecentIncidentsByLocationUseCase
    extends OLDUseCase<IncidentFilter, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetRecentIncidentsByLocationUseCase({required IncidentRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<IncidentOutput>>> execute(IncidentFilter filter) async {
    return await _repository.getRecentIncidentsBylocation(
      filter.term,
      filter.limit,
    );
  }
}
