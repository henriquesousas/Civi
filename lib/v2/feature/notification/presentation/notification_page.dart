import 'package:deehelp/v2/core/theme/app_colors.dart';
import 'package:deehelp/v2/feature/notification/domain/notification_alert.dart';
import 'package:deehelp/v2/feature/notification/presentation/widgets/ui_notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final notification = NotificationAlert.getFakeNotification();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notificações',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notification.length,
        separatorBuilder: (_, __) => Divider(
          color: context.appColor.outlineVariant,
          height: 1,
        ),
        itemBuilder: (context, index) {
          return UINotificationTile(item: notification[index]);
        },
      ),
    );
  }
}
