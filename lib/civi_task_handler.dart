import 'dart:async';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CiviTaskHandler extends TaskHandler {
  RealtimeChannel? _channel;
  SupabaseClient? _supabase;

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    try {
      //Salvar no preferencia
      _supabase = SupabaseClient(
        "https://qyqwuyrigoqubqpnayde.supabase.co",
        "sb_publishable_d4aHVgwM22a71tnZ7BZsIg_b9DPt9wD",
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    _channel = _supabase!
        .channel('public:reports')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'report',
          callback: (payload) async {
            final newRecord = payload.newRecord;

            final city = newRecord['city'];

            final type =
                EnumUtils.fromString(ItemType.values, newRecord['product_type'])
                    .labelRouberry;

            // FlutterForegroundTask.updateService(
            //   notificationTitle: 'Novo incidente em $city',
            //   notificationText: '$type detectado agora',
            // );

            await LocalNotificationService.showIncidentNotification(
              title: 'Novo incidente em $city',
              body: '$type detectado agora',
            );
            // opcional: enviar para UI
            FlutterForegroundTask.sendDataToMain({
              'type': 'new_incident',
              'payload': newRecord,
            });
          },
        )
        .subscribe();
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    if (_channel != null && _supabase != null) {
      await _supabase!.removeChannel(_channel!);
    }
  }

  @override
  void onRepeatEvent(DateTime timestamp) {
    // opcional: heartbeat, reconexão, health check
  }

  @override
  void onNotificationPressed() {
    FlutterForegroundTask.launchApp('/');
  }

  @override
  void onNotificationButtonPressed(String id) {}

  @override
  void onNotificationDismissed() {}
}
