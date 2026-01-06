import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/entity/incident_status.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';

class Incident {
  final String id;
  final IncidentStatus status;
  final TypeAlert type;
  final Product product;
  final String userId;
  final String? howTo;
  final DateTime? occurredAt;
  final IncidentLocal? local;
  DateTime createdAt;

  Incident({
    required this.id,
    required this.status,
    required this.type,
    required this.product,
    required this.userId,
    this.howTo,
    this.occurredAt,
    this.local,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
