import 'dart:ffi';

import 'package:deehelp/old_core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_incident_state.freezed.dart';

@freezed
abstract class AddIncidentState with _$AddIncidentState {
  const factory AddIncidentState({
    CurrentLocation? currentPlace,
    Product? product,
    String? fullAddress,
    String? errorFullAddress,
    String? howTo,
    Double? latitude,
    Double? longitude,
    DateTime? occurredAt,
    String? errorOccurredAt,
    TimeOfDay? timeOccurredAt,
    String? errorTimeOccurredAt,
    String? errorMessage,
    @Default(false) registeredsuccessfully,
    TextEditingController? stateController,
    String? stateError,
    TextEditingController? cityController,
    String? cityError,
    @Default(TypeAlert.none) TypeAlert type,
    @Default(false) bool isFormValid,
    @Default(false) bool isLoading,
    @Default(false) bool isProgressDone,
    String? alertId,
  }) = _AddIncidentState;

  factory AddIncidentState.initial() => AddIncidentState(
        stateController: TextEditingController(text: null),
        cityController: TextEditingController(text: null),
      );
}
