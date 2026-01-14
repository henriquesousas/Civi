import 'package:deehelp/core/services/location/place_model.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_incident_state.freezed.dart';

@freezed
abstract class AddIncidentState with _$AddIncidentState {
  const factory AddIncidentState({
    Placemodel? currentPlace,
    Product? product,
    String? fullAddress,
    String? errorFullAddress,
    String? howTo,
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
        stateController: TextEditingController(text: ''),
        cityController: TextEditingController(text: ''),
      );
}
