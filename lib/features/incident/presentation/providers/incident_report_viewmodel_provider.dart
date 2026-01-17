import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:deehelp/features/incident/presentation/views/add/add_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/views/add/state/add_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentViewmodelProvider =
    StateNotifierProvider.autoDispose<AddIncidentViewmodel, AddIncidentState>(
        (ref) {
  final addIncidentImmediatelyUsecase =
      ref.watch(addIncidentImmediatelyUseCaseProvider);

  return AddIncidentViewmodel(
      addIncidentImmediatelyUsecase: addIncidentImmediatelyUsecase);
});
