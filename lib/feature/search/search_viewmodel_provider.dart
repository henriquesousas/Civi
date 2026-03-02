import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:deehelp/feature/search/search_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchViewmodelProvider = StateNotifierProvider.autoDispose<
    SearchViewmodel, AsyncValue<List<IncidentOutput>>>((ref) {
  // final getRecentIncidentsByLocationUseCase =
  //     ref.watch(getRecentIncidentsByLocationUseCaseProvider);

  final getIncidentUsecase = ref.watch(getIncidentUsecaseProvider);
  return SearchViewmodel(
    getIncidentsUseCase: getIncidentUsecase,
  );
});
