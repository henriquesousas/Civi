import 'package:deehelp/features/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/features/incident/presentation/views/add/add_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/views/add/state/add_incident_state.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_usecase_providers.dart';
import 'package:deehelp/features/incident/presentation/views/listing/listing_incident_viewmodel.dart';
import 'package:deehelp/features/incident/presentation/views/listing/state/listing_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_viewmodel.dart';
import 'package:deehelp/features/products/presentation/providers/product_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addIncidentViewmodelProvider =
    StateNotifierProvider.autoDispose<AddIncidentViewmodel, AddIncidentState>(
        (ref) {
  final addIncidentImmediatelyUsecase =
      ref.watch(addIncidentImmediatelyUseCaseProvider);
  return AddIncidentViewmodel(
      addIncidentImmediatelyUsecase: addIncidentImmediatelyUsecase);
});

final listingIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    ListingIncidentViewmodel, ListingIncidentState>((ref) {
  final authenticatedUser = ref.watch(authenticatedUserProvider);
  final getIncidentByUserUseCase = ref.watch(getIncidentByUserUseCaseProvider);
  return ListingIncidentViewmodel(
    userId: authenticatedUser!.id,
    getIncidentByUserUseCase: getIncidentByUserUseCase,
  );
});

final updateIncidentViewmodelProvider = StateNotifierProvider.autoDispose<
    UpdateIncidentViewmodel, UpdateIncidentState>((ref) {
  final authenticatedUser = ref.watch(authenticatedUserProvider);
  final updateIncidentUsecase = ref.watch(updateIncidentUsecaseProvider);
  final currentIncidentSelected =
      ref.watch(listingIncidentViewmodelProvider).maybeMap(
            guard: (value) => value.incident,
            orElse: () => null,
          );
  return UpdateIncidentViewmodel(
    userId: authenticatedUser!.id,
    currenIncident: currentIncidentSelected!,
    updateIncidentUsecase: updateIncidentUsecase,
  );
});
