import 'package:deehelp/features/incident/domain/usecase/add/add_incident_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/delete/delete_incident_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_user_incidents_user_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_recent_incidents_by_location_usecase.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_usecase.dart';
import 'package:deehelp/features/incident/external/di/incident_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentImmediatelyUseCaseProvider =
    Provider<AddIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentUsecase(repository: repository);
});

final getIncidentByUserUseCaseProvider =
    Provider<GetUserIncidentsUseCase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetUserIncidentsUseCase(repository: repository);
});

final updateIncidentUsecaseProvider = Provider<UpdateIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return UpdateIncidentUsecase(repository: repository);
});

final deleteIncidentUsecaseProvider = Provider<DeleteIncidentUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return DeleteIncidentUsecase(repository: repository);
});

final getIncidentUsecaseProvider =
    Provider<GetRecentIncidentsByLocationUseCase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return GetRecentIncidentsByLocationUseCase(repository: repository);
});
