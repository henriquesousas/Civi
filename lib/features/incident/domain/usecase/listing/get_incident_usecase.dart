import 'package:deehelp/core/base/use_case.dart';
import 'package:deehelp/core/utils/result.dart';
import 'package:deehelp/features/incident/domain/incident_repository.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_filter.dart';

class GetIncidentUsecase
    extends UseCase<GetIncidentFilter, List<IncidentOutput>> {
  final IncidentRepository _repository;

  GetIncidentUsecase({required IncidentRepository repository})
      : _repository = repository;
  @override
  Future<Result<List<IncidentOutput>>> execute(GetIncidentFilter filter) async {
    return await _repository.getByFilter(filter);
  }
}
