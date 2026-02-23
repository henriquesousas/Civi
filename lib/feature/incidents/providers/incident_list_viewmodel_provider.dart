import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/list/incident_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incidentListViewModelProvider = AsyncNotifierProvider.autoDispose<
    IncidentListViewModel, List<IncidentOutput>>(
  IncidentListViewModel.new,
);
