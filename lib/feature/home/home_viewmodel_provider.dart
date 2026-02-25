import 'package:deehelp/feature/home/home_viewmodel.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewmodelProvider = StateNotifierProvider.autoDispose<HomeViewmodel,
    AsyncValue<List<IncidentOutput>>>((ref) {
  final getIncidentUseCase =
      ref.watch(getRecentIncidentsByLocationUseCaseProvider);
  return HomeViewmodel(getIncidentUsecase: getIncidentUseCase);
});
