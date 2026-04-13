import 'package:deehelp/civi_task_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForegroundMonitor {
  static Future<void> init() async {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        showBadge: true,
        playSound: true,
        enableVibration: true,
        channelId: 'civi_monitor_channel',
        channelName: 'Monitoramento de incidentes',
        channelDescription: 'Mantém o Civi ouvindo novos incidentes',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: ForegroundTaskOptions(
        autoRunOnBoot: false,
        allowWakeLock: true,
        allowWifiLock: true,
        eventAction: ForegroundTaskEventAction.nothing(),
      ),
    );
  }

  static Future<void> start() async {
    final permission =
        await FlutterForegroundTask.checkNotificationPermission();

    if (permission != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }
    final result = await FlutterForegroundTask.startService(
      notificationTitle: 'Civi monitorando alertas',
      notificationText: 'Ouvindo novos incidentes da sua região',
      callback: startCallback,
    );
    debugPrint("Service $result");
  }

  static Future<void> stop() async {
    await FlutterForegroundTask.stopService();
  }
}

@pragma('vm:entry-point')
void startCallback(Ref ref) {
  FlutterForegroundTask.setTaskHandler(CiviTaskHandler());
}
