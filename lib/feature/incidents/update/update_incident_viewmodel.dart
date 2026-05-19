import 'package:deehelp/old_core/errors/failure.dart';
import 'package:deehelp/old_core/services/permissions/location/location_service.dart';
import 'package:deehelp/old_core/extension/string_extension.dart';
import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/old_core/handlers/handler_error.dart';
import 'package:deehelp/old_core/utils/unit.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/usecase/delete/delete_incident_usecase.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/module/incident/domain/usecase/update/update_incident_usecase.dart';
import 'package:deehelp/feature/incidents/update/incident_field.dart';
import 'package:deehelp/feature/incidents/update/state/update_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class UpdateIncidentViewmodel extends StateNotifier<UpdateIncidentState> {
  IncidentOutput _currentIncident;
  final Map<IncidentField, String?> _cachedPlaceValues = {};
  final UpdateIncidentUsecase _updateIncidentUsecase;
  final DeleteIncidentUsecase _deleteIncidentUsecase;

  UpdateIncidentViewmodel({
    required IncidentOutput currenIncident,
    required UpdateIncidentUsecase updateIncidentUsecase,
    required DeleteIncidentUsecase deleteIncidentUsecase,
  })  : _currentIncident = currenIncident,
        _updateIncidentUsecase = updateIncidentUsecase,
        _deleteIncidentUsecase = deleteIncidentUsecase,
        super(UpdateIncidentState.initial(currenIncident));

  void delete(String incidentId) async {
    // await HandleCommand.execute<Unit, UpdateIncidentState>(
    //   updateState: (newState) => state = newState,
    //   command: () => _deleteIncidentUsecase.execute(incidentId),
    //   onLoading: () => state.copyWith(isLoading: true, errorMessage: null),
    //   onSuccess: (result) {
    //     return state.copyWith(deletedSuccessfully: true);
    //   },
    //   onError: (error) {
    //     return handleError<UpdateIncidentState>(
    //       error,
    //       (message, extra) {
    //         return state.copyWith(
    //           isLoading: false,
    //           errorMessage: message,
    //           deletedSuccessfully: false,
    //         );
    //       },
    //     );
    //   },
    // );
  }

  void update() async {
    _updateIncident(
      (error) {
        return handleError<UpdateIncidentState>(
          error,
          (message, extra) {
            return state.copyWith(
              isLoading: false,
              errorMessage: message,
              updatedSuccessfully: false,
            );
          },
        );
      },
    );
  }

  void updateStatus() async {
    _currentIncident = _currentIncident.copyWith(
      visibilty: !_currentIncident.visibilty,
    );
    state = state.copyWith(updatedValue: _currentIncident);
    await Future.delayed(const Duration(seconds: 1));
    _updateIncident(
      (error) {
        final rollbackVisibility = !_currentIncident.visibilty;
        _currentIncident =
            _currentIncident.copyWith(visibilty: rollbackVisibility);
        state = state.copyWith(
          isLoading: false,
          isGetCurrentLocattion: false,
          updatedValue: _currentIncident,
          errorUpdateStatusMessage:
              "Não foi possível realizar a mudança de status :(",
        );
        return state;
      },
    );
  }

  void getCurrentLocation(String value, IncidentField field) async {
    state = state.copyWith(
      isGetCurrentLocattion: true,
      updatedPlaceValue: null,
    );

    final cachedValue = _cachedPlaceValues[field];
    if (cachedValue != null) {
      _updateStateWithPlaceValue(cachedValue, field);
      return;
    }

    final place = await LocationService().getCurrentLocation();
    final placeValue = field.getPlaceValueFrom(place);
    _cachedPlaceValues[field] = placeValue;
    _updateStateWithPlaceValue(placeValue, field);
  }

  void onCityChange(String value) {
    _updateIncidentField(IncidentField.city, value);
  }

  void onStateChange(String value) {
    _updateIncidentField(IncidentField.state, value);
  }

  void onAddressChange(String value) {
    _updateIncidentField(IncidentField.address, value);
  }

  void onHowToChange(String value) {
    _updateIncidentField(IncidentField.howto, value);
  }

  void _updateIncident(UpdateIncidentState Function(Failure) onError) async {
    final dto = UpdateIncidentDto(
      incidentId: _currentIncident.id,
      status: _currentIncident.status,
      howTo: _currentIncident.howTo ?? '',
      city: _currentIncident.local?.city ?? '',
      state: _currentIncident.local?.state ?? '',
      address: _currentIncident.local?.address ?? '',
      visibility: _currentIncident.visibilty,
    );

    // await HandleCommand.execute<Unit, UpdateIncidentState>(
    //   updateState: (newState) => state = newState,
    //   command: () => _updateIncidentUsecase.execute(dto),
    //   onLoading: () => state.copyWith(
    //     isLoading: true,
    //     errorMessage: null,
    //     errorUpdateStatusMessage: null,
    //     updatedSuccessfully: false,
    //   ),
    //   onSuccess: (_) => state.copyWith(
    //     isLoading: false,
    //     updatedSuccessfully: true,
    //     updatedValue: _currentIncident,
    //   ),
    //   onError: (error) => onError(error),
    // );
  }

  void _updateIncidentField(IncidentField field, String value) {
    final updatedLocal = switch (field) {
      IncidentField.city => IncidentLocal(
          city: value,
          address: _currentIncident.local?.address ?? '',
          state: _currentIncident.local?.state ?? '',
        ),
      IncidentField.state => IncidentLocal(
          address: _currentIncident.local?.address ?? '',
          city: _currentIncident.local?.city ?? '',
          state: value,
        ),
      IncidentField.address => IncidentLocal(
          address: value,
          city: _currentIncident.local?.city ?? '',
          state: _currentIncident.local?.state ?? '',
        ),
      _ => _currentIncident.local
    };

    final updateHowTo = switch (field) {
      IncidentField.howto => value,
      _ => _currentIncident.howTo
    };

    _currentIncident =
        _currentIncident.copyWith(local: updatedLocal, howTo: updateHowTo);
    _validateField(field, value);
  }

  void _validateField(IncidentField field, String value) {
    final error = _validateFieldValue(field, value);

    state = state.copyWith(
      updateError: error,
      isFormValid: error == null,
      updatedSuccessfully: false,
    );
  }

  void _updateStateWithPlaceValue(String? placeValue, IncidentField field) {
    state = state.copyWith(
      isGetCurrentLocattion: false,
      updatedPlaceValue: placeValue,
    );
  }

  String? _validateFieldValue(IncidentField field, String value) {
    if (value.isNullOrEmpty() || value.length < 5) {
      return field.validationMessage;
    }

    if (field == IncidentField.howto && value.length < 30) {
      return field.validationMessage;
    }

    return null;
  }

  @override
  void dispose() {
    state.cityController?.dispose();
    state.stateController?.dispose();
    state.addressController?.dispose();
    state.howToController?.dispose();
    super.dispose();
  }
}
