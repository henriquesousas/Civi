import 'package:deehelp/infra/auth/providers/loggued_user_provider.dart';
import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
import 'package:deehelp/feature/incidents/report/report_incident_viewmodel.dart';
import 'package:deehelp/feature/incidents/report/state/add_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final reportIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    ReportIncidentViewmodel, AddIncidentState>((ref) {
  final authenticatedUser = ref.watch(logguedUserProviderOld);
  final addIncidentImmediatelyUsecase =
      ref.watch(addIncidentImmediatelyUseCaseProvider);

  return ReportIncidentViewmodel(
    ref: ref,
    addIncidentImmediatelyUsecase: addIncidentImmediatelyUsecase,
    authenticatedUser: authenticatedUser!,
  );
});
