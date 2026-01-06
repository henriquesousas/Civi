import 'package:deehelp/features/incident/domain/usecase/add/add_incident_immediately_usecase.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentImmediatelyUseCaseProvider =
    Provider<AddIncidentImmediatelyUsecase>((ref) {
  final repository = ref.watch(incidentRepositoryProvider);
  return AddIncidentImmediatelyUsecase(repository: repository);
});
