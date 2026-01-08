import 'package:deehelp/core/extensions/string_extension.dart';
import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/services/place.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/entity/incident_status.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_dto.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_usecase.dart';
import 'package:deehelp/features/incident/presentation/add/state/add_incident_state.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddIncidentViewmodel extends StateNotifier<AddIncidentState> {
  final AddIncidentUsecase _addIncidentImmediatelyUsecase;
  AddIncidentViewmodel({
    required AddIncidentUsecase addIncidentImmediatelyUsecase,
  })  : _addIncidentImmediatelyUsecase = addIncidentImmediatelyUsecase,
        super(AddIncidentState.initial());

  void selectProduct(Product product) =>
      state = state.copyWith(product: product);

  void selectTypeAlert(TypeAlert type) => state = state.copyWith(type: type);

  void addCurrentPlace(Place place) {
    state.stateController?.text = place.state;
    state.cityController?.text = place.city;
    state = state.copyWith(
      stateController: state.stateController,
      cityController: state.cityController,
    );
  }

  void saveImmediatelly(String userId) async {
    final dto = AddIncidentDto(
        product: state.product!,
        userId: userId,
        status: IncidentStatus.active,
        type: TypeAlert.immediately,
        occurredAt: DateTime.now(),
        occurredAtTime: TimeOfDay.now());
    _save(dto);
  }

  void saveDetailed(String userId) async {
    final dto = AddIncidentDto(
      product: state.product!,
      userId: userId,
      status: IncidentStatus.pending,
      type: TypeAlert.detailed,
      howTo: state.howTo,
      local: IncidentLocal(
        address: state.fullAddress!,
        city: state.cityController!.text,
        state: state.stateController!.text,
      ),
      occurredAt: state.occurredAt ?? DateTime.now(),
      occurredAtTime: state.timeOccurredAt ?? TimeOfDay.now(),
    );
    _save(dto);
  }

  void onCityChange(String value) {
    final error = value.isNullOrEmpty() ? "Cidade do ocorrido" : null;
    state.cityController?.text = value;
    state = state.copyWith(
      cityController: state.cityController,
      cityError: error,
    );

    _checkIfAllFieldAreValidated();
  }

  void onStateChange(String value) {
    final error = value.isNullOrEmpty() ? "Estado do ocorrido" : null;
    state.stateController?.text = value;
    state = state.copyWith(
      stateController: state.stateController,
      stateError: error,
    );

    _checkIfAllFieldAreValidated();
  }

  void onFullAddressChange(String value) {
    final isError = value.length > 5 ? null : "Endereço inválido";
    state = state.copyWith(
      fullAddress: value,
      errorFullAddress: isError,
    );

    _checkIfAllFieldAreValidated();
  }

  void onHowToChange(String value) {
    state = state.copyWith(
      howTo: value,
    );
  }

  void onOccurredAtChange(DateTime value) {
    final today = DateTime.now();
    final error =
        value.isAfter(today) ? "A data  não pode ser no futuro" : null;
    state = state.copyWith(
      occurredAt: value,
      errorOccurredAt: error,
    );

    _checkIfAllFieldAreValidated();
  }

  void onTimeOccurredAtChange(TimeOfDay value) {
    state = state.copyWith(
      timeOccurredAt: value,
    );

    _checkIfAllFieldAreValidated();
  }

  void _checkIfAllFieldAreValidated() {
    final bool areFieldsFilled = (state.occurredAt != null) &&
        (state.timeOccurredAt != null) &&
        (state.stateController?.text.isNotEmpty ?? false) &&
        (state.cityController?.text.isNotEmpty ?? false) &&
        (state.fullAddress != null);

    final bool noValidationErrors = state.errorFullAddress == null &&
        state.errorOccurredAt == null &&
        state.cityError == null;
    state.stateError == null;

    final isValid = areFieldsFilled && noValidationErrors;

    state = state.copyWith(isFormValid: isValid);
  }

  void _save(AddIncidentDto dto) async {
    await HandleCommand.execute<Unit, AddIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _addIncidentImmediatelyUsecase.execute(dto),
      onLoading: () => state.copyWith(errorMessage: null),
      onSuccess: (result) => state =
          state.copyWith(successMessage: "Incidente registrado com sucesso."),
      onError: (error) {
        return handleError<AddIncidentState>(
          error,
          (message, extra) {
            return state.copyWith(errorMessage: message);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    state.stateController?.dispose();
    state.cityController?.dispose();
    super.dispose();
  }
}
