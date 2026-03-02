import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_product_output.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_output.freezed.dart';

@freezed
abstract class IncidentOutput with _$IncidentOutput {
  const factory IncidentOutput({
    required String id,
    required String userId,
    required String alertId,
    required TypeAlert type,
    required IncidentProductOutput product,
    required ItemStatus status,
    required DateTime createdAt,
    required DateTime occurredAt,
    required TimeOfDay occurredAtTime,
    IncidentLocal? local,
    String? howTo,
    @Default(true) bool visibilty,
  }) = _IncidentOutput;
}
