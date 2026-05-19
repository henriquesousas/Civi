import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/feature/alerts/viewmodel/alert_state.dart';
import 'package:deehelp/module/alert/add_alert_dto.dart';
import 'package:deehelp/module/alert/add_alert_usecase.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AlertViewmodel extends StateNotifier<AlertState> {
  final AddAlertUsecase _addAlertUsecase;
  final CurrentLocation? _currentLocation;
  final LogguedUser? _authenticatedUser;
  AlertViewmodel({
    required AddAlertUsecase addAlertUsecase,
    required CurrentLocation? currentLocation,
    required LogguedUser? authenticatedUser,
  })  : _addAlertUsecase = addAlertUsecase,
        _currentLocation = currentLocation,
        _authenticatedUser = authenticatedUser,
        super(const AlertState());

  void sendAlert(String alertTitle, String typeItem) async {
    if (_currentLocation == null || _authenticatedUser == null) {
      return;
    }

    final local = IncidentLocal(
      address: _currentLocation.address,
      city: _currentLocation.city,
      state: _currentLocation.state,
      latitue: _currentLocation.latitude,
      longitude: _currentLocation.longitude,
    );
    final dto = AddAlertDto(
      userId: _authenticatedUser.id,
      local: local,
      alertTitle: alertTitle,
      typeItem: typeItem,
    );
    // await HandleCommand.execute<String, AlertState>(
    //   updateState: (newState) => state = newState,
    //   command: () => _addAlertUsecase.execute(dto),
    //   onLoading: () {
    //     return state.copyWith(isLoading: true, registeredsuccessfully: false);
    //   },
    //   onSuccess: (alertId) {
    //     return state.copyWith(isLoading: false, registeredsuccessfully: true);
    //   },
    //   onError: (error) {
    //     return handleError<AlertState>(
    //       error,
    //       (message, extra) {
    //         state =
    //             state.copyWith(isLoading: false, registeredsuccessfully: false);
    //         return state;
    //       },
    //     );
    //   },
    // );
  }
}
