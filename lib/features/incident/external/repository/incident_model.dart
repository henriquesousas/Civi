import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:flutter/material.dart';

class IncidentModel {
  static String _timeOfDayToPostgresTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:'
        '00'; // Segundos sempre 00
  }

  static Map<String, dynamic> toMap(Incident incident) {
    return {
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

  // static Product fromMap(Map<String, dynamic> map) {
  //   final images = (map["product_images"] as List)
  //       .map((e) => ImageMediaModel.fromMap(e))
  //       .toList();
  //   return Product(
  //     id: ProductId.from(map['id']),
  //     name: map['name'],
  //     code: map['code'],
  //     color: map['color'],
  //     brand: map['brand'],
  //     obs: map['obs'],
  //     year: map['year'],
  //     images: images,
  //     status: ProductSatus.values.firstWhere((e) => e.name == map['status']),
  //     type: map['type'],
  //     userId: map['user_id'],
  //     createdAt: DateTime.parse(map['created_at']),
  //   );
  // }
}
