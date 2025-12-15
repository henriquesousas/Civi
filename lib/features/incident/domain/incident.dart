import 'package:deehelp/features/incident/domain/creator.dart';
import 'package:deehelp/features/incident/domain/incident_local.dart';
import 'package:deehelp/features/incident/domain/incident_status.dart';
import 'package:deehelp/features/incident/domain/incident_type.dart';
import 'package:deehelp/features/incident/domain/privacy_level.dart';
import 'package:deehelp/features/my_products/domain/entities/product.dart';

class Incident {
  final String id;
  final Creator creator;
  final IncidentStatus status;
  final IncidentType type;
  final PrivacyLevel level;
  final Product product;
  final String? howTo;
  final DateTime? occurredAt;
  final IncidentLocal? local;
  final DateTime createdAt;

  Incident({
    required this.id,
    required this.creator,
    required this.status,
    required this.type,
    required this.level,
    required this.product,
    required this.createdAt,
    this.howTo,
    this.occurredAt,
    this.local,
  });
}
