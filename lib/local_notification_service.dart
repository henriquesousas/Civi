import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('ic_notificacao');

    const settings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(settings: settings);
  }

  static Future<void> showIncidentNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'civi_incidents_channel',
      'Incidentes',
      channelDescription: 'Notificações de novos incidentes',
      importance: Importance.max,
      priority: Priority.high,
      icon: 'ic_notificacao',
    );

    const details = NotificationDetails(android: androidDetails);

    await _plugin.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: body,
      notificationDetails: details,
      payload: "Ok",
    );
  }
}
