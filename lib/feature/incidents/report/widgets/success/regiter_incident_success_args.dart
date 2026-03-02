import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';

class RegiterIncidentSuccessArgs {
  final Product item;
  final String alertId;
  final TypeAlert typeAlert;
  final ItemType itemType;
  final DateTime createdAt;
  final IncidentLocal? local;

  RegiterIncidentSuccessArgs({
    required this.item,
    required this.alertId,
    required this.typeAlert,
    required this.itemType,
    required this.createdAt,
    this.local,
  });
}
