import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:deehelp/feature/incidents/update/state/update_incident_state.dart';
import 'package:deehelp/feature/incidents/update/update_incident_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    UpdateIncidentViewmodel, UpdateIncidentState>((ref) {
  final updateIncidentUsecase = ref.watch(updateIncidentUsecaseProvider);
  final currentIncidentSelected = ref.watch(incidentSelectedProvider);
  final deleteIncidentUsecase = ref.watch(deleteIncidentUsecaseProvider);
  return UpdateIncidentViewmodel(
    currenIncident: currentIncidentSelected!,
    updateIncidentUsecase: updateIncidentUsecase,
    deleteIncidentUsecase: deleteIncidentUsecase,
  );
});
