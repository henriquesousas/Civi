import 'package:deehelp/old_core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/feature/alerts/providers/add_alert_usecase_provider.dart';
import 'package:deehelp/feature/alerts/viewmodel/alert_state.dart';
import 'package:deehelp/feature/alerts/viewmodel/alert_viewmodel.dart';
import 'package:deehelp/infra/auth/providers/loggued_user_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final addAlertViewModelProvider =
    StateNotifierProvider.autoDispose<AlertViewmodel, AlertState>((ref) {
  final authenticatedUser = ref.watch(logguedUserProviderOld);
  final currentLocation = ref.read(currentLocationProvider);
  final addAlertUsecase = ref.watch(addAlertUseCaseProvider);

  ref.onDispose(() {
    debugPrint("AddAlertViewModel disposed");
  });
  return AlertViewmodel(
      addAlertUsecase: addAlertUsecase,
      currentLocation: currentLocation,
      authenticatedUser: authenticatedUser);
});
