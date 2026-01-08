import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/entity/incident_status.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class Incident {
  final String id;
  final IncidentStatus status;
  final TypeAlert type;
  final Product product;
  final String userId;
  final String? howTo;
  final IncidentLocal? local;
  DateTime createdAt;
  DateTime occurredAt;
  TimeOfDay occurredAtTime;

  Incident({
    required this.id,
    required this.status,
    required this.type,
    required this.product,
    required this.userId,
    this.howTo,
    this.local,
    DateTime? createdAt,
    DateTime? occurredAt,
    TimeOfDay? occurredAtTime,
  })  : createdAt = createdAt ?? DateTime.now(),
        occurredAt = occurredAt ?? DateTime.now(),
        occurredAtTime = occurredAtTime ?? TimeOfDay.now();
}
