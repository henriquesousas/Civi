import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_product_output.dart';
import 'package:flutter/material.dart';

final _shimmer = IncidentOutput(
  id: 'any',
  userId: 'any',
  alertId: 'any',
  product: IncidentProductOutput(
    productId: "123",
    name: "any name",
    code: "any",
    images: List.empty(),
  ),
  status: IncidentStatus.active,
  type: TypeAlert.detailed,
  howTo: 'loremipsin loremipsm loremipsum loremipsum',
  local: IncidentLocal(address: "any", city: "any", state: "any"),
  createdAt: DateTime.now(),
  occurredAt: DateTime.now(),
  occurredAtTime: TimeOfDay.now(),
);

final listShimmer = List.generate(10, (index) => _shimmer);
