import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_dto.dart';
import 'package:deehelp/features/incident/domain/usecase/update/update_incident_usecase.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateIncidentViewmodel extends StateNotifier<UpdateIncidentState> {
  final String _userId;
  IncidentOutput _currentIncident;
  final UpdateIncidentUsecase _updateIncidentUsecase;
  UpdateIncidentViewmodel({
    required String userId,
    required IncidentOutput currenIncident,
    required UpdateIncidentUsecase updateIncidentUsecase,
  })  : _userId = userId,
        _currentIncident = currenIncident,
        _updateIncidentUsecase = updateIncidentUsecase,
        super(UpdateIncidentState.initial());

  void update() async {
    final dto = UpdateIncidentDto(
      incidentId: _currentIncident.id,
      status: _currentIncident.status,
      howTo: _currentIncident.howTo ?? '',
      city: _currentIncident.local?.city ?? '',
      state: _currentIncident.local?.city ?? '',
      address: _currentIncident.local?.address ?? '',
    );

    await HandleCommand.execute<Unit, UpdateIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _updateIncidentUsecase.execute(dto),
      onLoading: () => state.copyWith(
        isLoading: true,
        errorMessage: null,
        updatedSuccessfully: false,
      ),
      onSuccess: (result) => state.copyWith(
        updatedSuccessfully: true,
        isLoading: false,
      ),
      onError: (error) {
        return handleError<UpdateIncidentState>(
          error,
          (message, extra) {
            return state.copyWith(
              updatedSuccessfully: false,
              errorMessage: message,
              isLoading: false,
            );
          },
        );
      },
    );
  }

  void onCityChange(String value) {
    final error =
        value.isNullOrEmpty() || value.length < 5 ? "Cidade do ocorrido" : null;
    state.cityController?.text = value;
    state = state.copyWith(
      cityController: state.cityController,
      errorMessage: error,
      isFormValid: error == null,
      updatedSuccessfully: false,
    );

    if (error == null) {
      final local = IncidentLocal(
        address: _currentIncident.local?.address ?? '',
        city: value,
        state: _currentIncident.local?.state ?? '',
      );
      _currentIncident = _currentIncident.copyWith(local: local);
    }
  }
}
