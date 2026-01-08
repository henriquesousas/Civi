import 'package:deehelp/core/services/place.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_incident_state.freezed.dart';

@freezed
abstract class AddIncidentState with _$AddIncidentState {
  const factory AddIncidentState({
    Place? currentPlace,
    Product? product,
    String? fullAddress,
    String? errorFullAddress,
    String? howTo,
    DateTime? occurredAt,
    String? errorOccurredAt,
    TimeOfDay? timeOccurredAt,
    String? errorTimeOccurredAt,
    String? errorMessage,
    String? successMessage,
    TextEditingController? stateController,
    String? stateError,
    TextEditingController? cityController,
    String? cityError,
    @Default(TypeAlert.none) TypeAlert type,
    @Default(false) bool isFormValid,
  }) = _AddIncidentState;

  factory AddIncidentState.initial() => AddIncidentState(
        stateController: TextEditingController(text: ''),
        cityController: TextEditingController(text: ''),
        product: null,
      );
}
