import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_product_output.dart';
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
    String? howTo,
    required IncidentProductOutput product,
    IncidentLocal? local,
    required IncidentStatus status,
    required DateTime createdAt,
    required DateTime occurredAt,
    required TimeOfDay occurredAtTime,
  }) = _IncidentOutput;
}

// class IncidentOutput {
//   final String id;
//   final String userId;
//   final String alertId;
//   final TypeAlert type;
//   final String? howTo;
//   final IncidentProductOutput product;
//   final IncidentLocal? local;
//   final IncidentStatus status;
//   DateTime createdAt;
//   DateTime occurredAt;
//   TimeOfDay occurredAtTime;

//   IncidentOutput({
//     required this.id,
//     required this.userId,
//     required this.alertId,
//     required this.product,
//     required this.status,
//     required this.type,
//     required this.howTo,
//     required this.local,
//     required this.createdAt,
//     required this.occurredAt,
//     required this.occurredAtTime,
//   });
// }
