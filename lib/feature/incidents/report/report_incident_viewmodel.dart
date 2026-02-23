import 'package:deehelp/old_core/ui/extensions/string_extension.dart';
import 'package:deehelp/old_core/handlers/handle_command.dart';
import 'package:deehelp/old_core/services/location/current_location.dart';
import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/usecase/add/add_incident_dto.dart';
import 'package:deehelp/module/incident/domain/usecase/add/add_incident_usecase.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_event_provider.dart';
import 'package:deehelp/feature/incidents/report/events/report_incident_event.dart';
import 'package:deehelp/feature/incidents/report/state/add_incident_state.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class ReportIncidentViewmodel extends StateNotifier<AddIncidentState> {
  static final _logger = Logger("AddIncidentViewmodel");
  final Ref _ref;
  final AuthenticatedUser _authenticatedUser;
  final AddIncidentUsecase _addIncidentUsecase;
  ReportIncidentViewmodel({
    required Ref ref,
    required AddIncidentUsecase addIncidentImmediatelyUsecase,
    required AuthenticatedUser authenticatedUser,
  })  : _addIncidentUsecase = addIncidentImmediatelyUsecase,
        _ref = ref,
        _authenticatedUser = authenticatedUser,
        super(AddIncidentState.initial());

  void clear() => state = state.copyWith(errorMessage: null);

  void selectProduct(Product product) {
    state = state.copyWith(product: product);
  }

  void selectAlertType(TypeAlert type) => state = state.copyWith(type: type);

  void addCurrentPlace(CurrentLocation? place) {
    if (place == null) return;
    state.stateController?.text = place.state ?? '';
    state.cityController?.text = place.city ?? '';
    state = state.copyWith(
      stateController: state.stateController,
      cityController: state.cityController,
    );
  }

  void stopSaveImediatelly() {
    state = state.copyWith(isProgressDone: true);
    final dto = AddIncidentDto(
      product: state.product!,
      userId: _authenticatedUser.id,
      status: IncidentStatus.active,
      type: TypeAlert.immediately,
      occurredAt: DateTime.now(),
      occurredAtTime: TimeOfDay.now(),
      local: IncidentLocal(
        address: null,
        city: state.cityController?.text,
        state: state.stateController?.text,
      ),
    );
    _save(dto);
  }

  void saveImmediatelly() {
    // state = state.copyWith(isLoading: true, type: TypeAlert.immediately);
    _ref.read(reportIncidentEventProvider.notifier).state =
        const ReportIncidentEvent.loadProgress();
  }

  void saveDetailed() async {
    state = state.copyWith(isLoading: true, type: TypeAlert.detailed);
    final dto = AddIncidentDto(
      product: state.product!,
      userId: _authenticatedUser.id,
      status: IncidentStatus.pending,
      type: TypeAlert.detailed,
      howTo: state.howTo,
      local: IncidentLocal(
        address: state.fullAddress!,
        city: state.cityController!.text,
        state: state.stateController!.text,
      ),
      occurredAt: state.occurredAt!,
      occurredAtTime: state.timeOccurredAt!,
    );
    _logger.info("Iniciando chamada de salvar incidente...");
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
    _logger.info("Iniciando chamada de salvar incidente...");
    await HandleCommand.execute<String, AddIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _addIncidentUsecase.execute(dto),
      onLoading: () {
        return state.copyWith(isLoading: true);
      },
      onSuccess: (alertId) {
        _logger.info("Incident salvo com sucesso");
        _ref.read(reportIncidentEventProvider.notifier).state =
            const ReportIncidentEvent.successfully();
        return state;
      },
      onError: (error) {
        _logger.info("Erro ao salvar incident ${error.toString()}");
        _ref.read(reportIncidentEventProvider.notifier).state =
            ReportIncidentEvent.error(error.toString());
        return state;
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
