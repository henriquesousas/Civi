import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_incident_state.freezed.dart';

@freezed
abstract class UpdateIncidentState with _$UpdateIncidentState {
  const factory UpdateIncidentState({
    TextEditingController? stateController,
    TextEditingController? cityController,
    TextEditingController? addressController,
    TextEditingController? howToController,
    IncidentOutput? updatedValue,
    String? updatedPlaceValue,
    String? updateError,
    String? errorMessage,
    String? errorUpdateStatusMessage,
    @Default(false) bool updatedSuccessfully,
    @Default(false) bool deletedSuccessfully,
    @Default(false) bool isFormValid,
    @Default(false) bool isLoading,
    @Default(false) bool isGetCurrentLocattion,
  }) = _UpdateIncidentState;

  factory UpdateIncidentState.initial(IncidentOutput updatedValue) =>
      UpdateIncidentState(
        stateController: TextEditingController(text: ''),
        cityController: TextEditingController(text: ''),
        addressController: TextEditingController(text: ''),
        howToController: TextEditingController(text: ''),
        updatedValue: updatedValue,
      );
}
