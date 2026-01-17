import 'package:deehelp/features/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:deehelp/features/incident/presentation/report/add_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/report/state/add_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    ReportIncidentViewmodel, AddIncidentState>((ref) {
  final authenticatedUser = ref.watch(authenticatedUserProvider);
  final addIncidentImmediatelyUsecase =
      ref.watch(addIncidentImmediatelyUseCaseProvider);

  return ReportIncidentViewmodel(
    ref: ref,
    addIncidentImmediatelyUsecase: addIncidentImmediatelyUsecase,
    authenticatedUser: authenticatedUser!,
  );
});
