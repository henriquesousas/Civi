import 'package:deehelp/features/incident/domain/usecase/add/add_incident_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_by_user_usecase.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentImmediatelyUseCaseProvider =
    Provider<AddIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentUsecase(repository: repository);
});

final getIncidentByUserUseCaseProvider =
    Provider<GetIncidentByUserUseCase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetIncidentByUserUseCase(repository: repository);
});
