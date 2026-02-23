import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';

//TODO: Nao passar todo o Product apenas o Id dele
class Incident {
  final String id;
  final String? alertId;
  final IncidentStatus status;
  final TypeAlert type;
  final Product product;
  final String userId;
  final String? howTo;
  final IncidentLocal? local;
  bool visibility;
  DateTime createdAt;
  DateTime occurredAt;
  TimeOfDay occurredAtTime;

  Incident({
    required this.id,
    required this.alertId,
    required this.status,
    required this.type,
    required this.product,
    required this.userId,
    this.visibility = true,
    this.howTo,
    this.local,
    DateTime? createdAt,
    DateTime? occurredAt,
    TimeOfDay? occurredAtTime,
  })  : createdAt = createdAt ?? DateTime.now(),
        occurredAt = occurredAt ?? DateTime.now(),
        occurredAtTime = occurredAtTime ?? TimeOfDay.now();
}
