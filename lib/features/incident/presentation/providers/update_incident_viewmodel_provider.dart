import 'package:deehelp/features/incident/presentation/providers/incident_selected_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    UpdateIncidentViewmodel, UpdateIncidentState>((ref) {
  final updateIncidentUsecase = ref.watch(updateIncidentUsecaseProvider);
  final currentIncidentSelected = ref.watch(incidentSelectedProvider);
  return UpdateIncidentViewmodel(
    currenIncident: currentIncidentSelected!,
    updateIncidentUsecase: updateIncidentUsecase,
  );
});
