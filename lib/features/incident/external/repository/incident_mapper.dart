import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/features/products/external/repository/image_media_model.dart';
import 'package:flutter/material.dart';

class IncidentMapper {
  static String _timeOfDayToPostgresTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:'
        '00';
  }

  static TimeOfDay _parseTimeFromString(String timeString) {
    try {
      // Formato esperado: "HH:MM:SS" do PostgreSQL
      final parts = timeString.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      // Fallback para o horário atual
      final now = TimeOfDay.now();
      return TimeOfDay(hour: now.hour, minute: now.minute);
    }
  }

  static Map<String, dynamic> toMap(Incident incident) {
    return {
      'alert_id': incident.alertId,
      'product_id': incident.product.id.value,
      'user_id': incident.userId,
      'type': incident.type.name,
      'how_to': incident.howTo,
      'city': incident.local?.city,
      'state': incident.local?.state,
      'approximate_address': incident.local?.address,
      'occurred_at': incident.occurredAt.toUtc().toIso8601String(),
      'occurred_hour': _timeOfDayToPostgresTime(incident.occurredAtTime),
      'status': incident.status.name,
      'created_at': incident.createdAt.toUtc().toIso8601String(),
    };
  }

  static IncidentOutput fromMap(Map<String, dynamic> map) {
    final images = (map['product']["product_images"] as List)
        .map((e) => ImageMediaModel.fromMap(e))
        .toList();
    return IncidentOutput(
      id: map['id'],
      userId: map['user_id'],
      type: TypeAlert.values.firstWhere((e) => e.name == map['type']),
      howTo: map['how_to'],
      visibilty: map['visibility'],
      local: IncidentLocal(
        address: map['approximate_address'] ?? '',
        city: map['city'] ?? '',
        state: map['state'] ?? '',
      ),
      status: IncidentStatus.values.firstWhere((e) => e.name == map['status']),
      alertId: map['alert_id'],
      product: IncidentProductOutput(
        productId: map['product']['id'],
        name: map['product']['name'],
        code: map['product']['code'],
        images: images,
      ),
      createdAt: DateTime.parse(map['created_at']),
      occurredAt: DateTime.parse(map['occurred_at']),
      occurredAtTime: _parseTimeFromString(map['occurred_hour']),
    );
  }
}
