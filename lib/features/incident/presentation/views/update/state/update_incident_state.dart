import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_incident_state.freezed.dart';

@freezed
abstract class UpdateIncidentState with _$UpdateIncidentState {
  const factory UpdateIncidentState({
    String? address,
    String? howTo,
    String? errorMessage,
    TextEditingController? stateController,
    TextEditingController? cityController,
    // String? errorAddress,
    // String? stateError,
    // String? cityError,
    String? updateError,
    @Default(false) bool updatedSuccessfully,
    @Default(false) bool isFormValid,
    @Default(false) bool isLoading,
  }) = _UpdateIncidentState;

  factory UpdateIncidentState.initial() => UpdateIncidentState(
        stateController: TextEditingController(text: ''),
        cityController: TextEditingController(text: ''),
      );
}
