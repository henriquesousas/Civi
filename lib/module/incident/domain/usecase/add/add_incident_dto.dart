import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:flutter/material.dart';

class AddIncidentDto {
  final Product product;
  final String userId;
  final TypeAlert type;
  final IncidentStatus status;
  final DateTime occurredAt;
  final TimeOfDay occurredAtTime;
  final String? howTo;
  final IncidentLocal? local;

  AddIncidentDto({
    required this.product,
    required this.userId,
    required this.status,
    required this.type,
    required this.occurredAt,
    required this.occurredAtTime,
    this.howTo,
    this.local,
  });
}
