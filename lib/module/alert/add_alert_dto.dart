import 'package:deehelp/module/incident/domain/entity/incident_local.dart';

class AddAlertDto {
  final String userId;
  final IncidentLocal local;
  final String alertTitle;
  final String typeItem;

  AddAlertDto({
    required this.userId,
    required this.local,
    required this.alertTitle,
    required this.typeItem,
  });
}
