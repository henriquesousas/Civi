// enum IncidentKind { robbery, theft, recovered }

import 'package:deehelp/feature/home/widgets/recent_incident_card.dart';

enum IncidentStatus { active, inReview, canceled }

enum ItemTypeOld { car, moto, phone }

class FakeIncidentListModel {
  final String id;
  final String itemName;
  final ItemTypeOld itemType;
  final IncidentKind kind;
  final IncidentStatus status;
  final String location;
  final String happenedAt;
  final String postedAt;
  final String how; // ✅ até 300 chars
  final String? imageUrl;

  const FakeIncidentListModel({
    required this.id,
    required this.itemName,
    required this.itemType,
    required this.kind,
    required this.status,
    required this.location,
    required this.happenedAt,
    required this.postedAt,
    required this.how,
    required this.imageUrl,
  });

  bool get isVehicle =>
      itemType == ItemTypeOld.car || itemType == ItemTypeOld.moto;
}
