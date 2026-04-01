import 'package:deehelp/core/ui/widgets/badge/status_style.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_product_output.dart';
import 'package:deehelp/module/incident/domain/usecase/kind.dart';
import 'package:deehelp/module/incident/domain/usecase/report_type.dart';
import 'package:deehelp/module/incident/external/repository/region_mapper.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:deehelp/module/item/repository/image_media_model.dart';
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
      "title": incident.title,
      'product_id': incident.product?.id.value,
      'product_type': incident.product?.type,
      'user_id': incident.userId,
      'how_to': incident.howTo,
      'city': incident.local?.city,
      'state': incident.local?.state,
      'address': incident.local?.address,
      'occurred_at': incident.occurredAt.toUtc().toIso8601String(),
      'hour': _timeOfDayToPostgresTime(incident.occurredAtTime),
      'status': incident.status.name,
      'report_type': incident.reportType.name,
      'kind': incident.kind.name,
      'region_id': incident.regionId,
      'lat': incident.local?.latitue,
      'long': incident.local?.longitude,
      'point': incident.local?.longitude != null
          ? 'POINT(${incident.local!.longitude} ${incident.local!.latitue})'
          : null,
      'expires_at': incident.expiresAt?.toUtc().toIso8601String(),
      'created_at': incident.createdAt.toUtc().toIso8601String(),
    };
  }

  static IncidentOutput fromMap(Map<String, dynamic> map) {
    List<ImageMedia> images = [];
    if (map['product'] != null) {
      images = (map['product']["product_images"] as List)
          .map((e) => ImageMediaModel.fromMap(e))
          .toList();
    }

    return IncidentOutput(
      id: map['id'],
      title: map['title'],
      isPlatformGenerated: map['is_platform_generated'],
      userId: map['user_id'],
      // type: TypeAlert.values.firstWhere((e) => e.name == map['type']),
      type: TypeAlert.detailed,
      howTo: map['how_to'],
      visibilty: map['verified'],
      local: IncidentLocal(
        address: map['address'],
        city: map['city'] ?? '',
        state: map['state'] ?? '',
        latitue: map['latitude'],
        longitude: map['longitude'],
      ),
      region: RegionMapper.fromMap(map['regions']),
      status: ItemStatus.values.firstWhere((e) => e.name == map['status']),
      kind: Kind.values.firstWhere((e) => e.name == map['kind']),
      reportType:
          ReportType.values.firstWhere((e) => e.name == map['report_type']),
      alertId: map['alert_id'],
      productType: map['product_type'],
      product: map['product'] != null
          ? IncidentProductOutput(
              productId: map['product']['id'],
              name: map['product']['name'],
              code: map['product']['code'],
              color: map['product']['color'],
              brand: map['product']['brand'],
              type: map['product']['type'],
              obs: map['product']['obs'],
              year: map['product']['year'].toString(),
              images: images,
            )
          : null,
      createdAt: DateTime.parse(map['created_at']),
      occurredAt: DateTime.parse(map['occurred_at']),
      occurredAtTime: _parseTimeFromString(map['hour']),
      expiresAt:
          map['expires_at'] != null ? DateTime.parse(map['expires_at']) : null,
    );
  }

  static List<IncidentOutput> toList(List<Map<String, dynamic>> data) {
    if (data.isEmpty) return [];
    return data.map<IncidentOutput>((dynamic item) {
      final map = item as Map<String, dynamic>;
      return IncidentMapper.fromMap(map);
    }).toList();
  }

  static List<IncidentOutput> toListV2(List data) {
    if (data.isEmpty) return [];
    return data.map<IncidentOutput>((dynamic item) {
      final map = item as Map<String, dynamic>;
      return IncidentMapper.fromMap(map);
    }).toList();
  }
}
