import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/kind.dart';
import 'package:deehelp/module/incident/domain/usecase/report_type.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';

//TODO: Nao passar todo o Product apenas o Id dele
class Incident {
  final String id;
  final String? alertId;
  final String? regionId;
  final IncidentStatus status;
  final Product? product;
  final String userId;
  final String? howTo;
  final IncidentLocal? local;
  final Kind kind;
  final ReportType reportType;
  final String? title;
  bool visibility;
  DateTime createdAt;
  DateTime? expiresAt;
  DateTime occurredAt;
  TimeOfDay occurredAtTime;

  Incident({
    required this.id,
    required this.alertId,
    required this.status,
    required this.userId,
    required this.kind,
    required this.reportType,
    this.title,
    this.product,
    this.visibility = true,
    this.howTo,
    this.local,
    this.expiresAt,
    this.regionId,
    DateTime? createdAt,
    DateTime? occurredAt,
    TimeOfDay? occurredAtTime,
  })  : createdAt = createdAt ?? DateTime.now(),
        occurredAt = occurredAt ?? DateTime.now(),
        occurredAtTime = occurredAtTime ?? TimeOfDay.now();
}
