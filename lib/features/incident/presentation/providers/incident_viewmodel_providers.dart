import 'package:deehelp/features/incident/presentation/add/add_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/add/state/add_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentViewmodelProvider =
    StateNotifierProvider.autoDispose<AddIncidentViewmodel, AddIncidentState>(
        (ref) {
  return AddIncidentViewmodel();
});
