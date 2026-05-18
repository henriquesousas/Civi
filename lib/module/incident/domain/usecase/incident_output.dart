import 'package:deehelp/old_core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/region.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/module/incident/domain/usecase/kind.dart';
import 'package:deehelp/module/incident/domain/usecase/report_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_output.freezed.dart';

@freezed
abstract class IncidentOutput with _$IncidentOutput {
  const factory IncidentOutput({
    required String id,
    required String? title,
    required String userId,
    required String alertId,
    required String productType,
    required TypeAlert type,
    required IncidentProductOutput? product,
    required ItemStatus status,
    required Kind kind,
    required ReportType reportType,
    required DateTime createdAt,
    required DateTime occurredAt,
    required DateTime? expiresAt,
    required TimeOfDay occurredAtTime,
    required Region? region,
    IncidentLocal? local,
    String? howTo,
    @Default(false) bool isPlatformGenerated,
    @Default(true) bool visibilty,
  }) = _IncidentOutput;
}
