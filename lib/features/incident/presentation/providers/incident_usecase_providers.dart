import 'package:deehelp/features/incident/domain/usecase/add/add_incident_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/delete/delete_incident_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_by_user_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_usecase.dart';
import 'package:deehelp/features/incident/external/di/incident_repository_providers.dart';
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

final updateIncidentUsecaseProvider = Provider<UpdateIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return UpdateIncidentUsecase(repository: repository);
});

final deleteIncidentUsecaseProvider = Provider<DeleteIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return DeleteIncidentUsecase(repository: repository);
});
