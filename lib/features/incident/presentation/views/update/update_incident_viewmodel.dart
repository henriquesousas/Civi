import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_usecase.dart';
import 'package:deehelp/features/incident/presentation/views/update/incident_field.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateIncidentViewmodel extends StateNotifier<UpdateIncidentState> {
  IncidentOutput _currentIncident;
  final Map<IncidentField, String?> _cachedPlaceValues = {};
  final UpdateIncidentUsecase _updateIncidentUsecase;

  UpdateIncidentViewmodel({
    required IncidentOutput currenIncident,
    required UpdateIncidentUsecase updateIncidentUsecase,
  })  : _currentIncident = currenIncident,
        _updateIncidentUsecase = updateIncidentUsecase,
        super(UpdateIncidentState.initial(currenIncident));

  void update() async {
    _update2(
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
    // final dto = UpdateIncidentDto(
    //   incidentId: _currentIncident.id,
    //   status: _currentIncident.status,
    //   howTo: _currentIncident.howTo ?? '',
    //   city: _currentIncident.local?.city ?? '',
    //   state: _currentIncident.local?.state ?? '',
    //   address: _currentIncident.local?.address ?? '',
    //   visibility: _currentIncident.visibilty,
    // );

    // await HandleCommand.execute<Unit, UpdateIncidentState>(
    //   updateState: (newState) => state = newState,
    //   command: () => _updateIncidentUsecase.execute(dto),
    //   onLoading: () => state.copyWith(
    //     isLoading: true,
    //     errorMessage: null,
    //     updatedSuccessfully: false,
    //   ),
    //   onSuccess: (_) => state.copyWith(
    //     isLoading: false,
    //     updatedSuccessfully: true,
    //     updatedValue: _currentIncident,
    //   ),
    //   onError: (error) {
    //     return handleError<UpdateIncidentState>(
    //       error,
    //       (message, extra) {
    //         return state.copyWith(
    //           isLoading: false,
    //           errorMessage: message,
    //           updatedSuccessfully: false,
    //         );
    //       },
    //     );
    //   },
    // );
  }

  void _update2(UpdateIncidentState Function(Failure) onError) async {
    final dto = UpdateIncidentDto(
      incidentId: _currentIncident.id,
      status: _currentIncident.status,
      howTo: _currentIncident.howTo ?? '',
      city: _currentIncident.local?.city ?? '',
      state: _currentIncident.local?.state ?? '',
      address: _currentIncident.local?.address ?? '',
      visibility: _currentIncident.visibilty,
    );

    await HandleCommand.execute<Unit, UpdateIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _updateIncidentUsecase.execute(dto),
      onLoading: () => state.copyWith(
        isLoading: true,
        errorMessage: null,
        errorUpdateStatusMessage: null,
        updatedSuccessfully: false,
      ),
      onSuccess: (_) => state.copyWith(
        isLoading: false,
        updatedSuccessfully: true,
        updatedValue: _currentIncident,
      ),
      onError: (error) => onError(error),
    );
  }

  void updateStatus() async {
    _currentIncident = _currentIncident.copyWith(
      visibilty: !_currentIncident.visibilty,
    );
    state = state.copyWith(updatedValue: _currentIncident);
    await Future.delayed(const Duration(seconds: 1));
    _update2(
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

    final place = await LocationService().getCurrentPlace();
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

    _currentIncident = _currentIncident.copyWith(local: updatedLocal);
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
