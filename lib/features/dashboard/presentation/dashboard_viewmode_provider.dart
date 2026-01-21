import 'package:deehelp/features/dashboard/presentation/dashboard_viewmodel.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewmodelProvider = StateNotifierProvider.autoDispose<
    DashboardViewmodel, AsyncValue<List<IncidentOutput>>>((ref) {
  final getIncidentUseCase = ref.watch(getIncidentUsecaseProvider);
  return DashboardViewmodel(getIncidentUsecase: getIncidentUseCase);
});
