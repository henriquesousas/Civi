import 'notification_message.dart';

class DomainNotification {
  final Set<NotificationMessage> _notifications = {};
  List<NotificationMessage> get notifications => _notifications.toList();

  bool get hasErrors => _notifications.isNotEmpty;

  bool get isValid => !hasErrors;

  void add(String property, String message) {
    _notifications
        .add(NotificationMessage(property: property, message: message));
  }

  void addAll(List<NotificationMessage> notifications) {
    _notifications.addAll(notifications);
  }

  void copy(DomainNotification notification) {
    _notifications.addAll(notification.notifications);
  }

  List<String> get getErrors {
    return _notifications.map((n) => n.message).toList();
  }
}
