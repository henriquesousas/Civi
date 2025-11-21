import 'package:deehelp/core/domain/validation/validation_handler.dart';

import 'notification_message.dart';

class DomainNotification implements ValidationHandler {
  final Set<NotificationMessage> _notifications = {};
  List<NotificationMessage> get notifications => _notifications.toList();

  bool get hasErrors => _notifications.isNotEmpty;

  bool get isValid => !hasErrors;

  //TODO: Remove
  void add(String property, String message) {
    _notifications
        .add(NotificationMessage(property: property, message: message));
  }

//TODO: Remove
  void addAll(List<NotificationMessage> notifications) {
    _notifications.addAll(notifications);
  }

  @override
  DomainNotification append(String property, String message) {
    _notifications
        .add(NotificationMessage(property: property, message: message));
    return this;
  }

  void clear() {
    _notifications.clear();
  }

  @override
  ValidationHandler appendAll(List<NotificationMessage> notifications) {
    _notifications.addAll(notifications);
    return this;
  }

  @override
  void copy(DomainNotification notification) {
    _notifications.addAll(notification.notifications);
  }

  List<String> get getErrors {
    return _notifications.map((n) => n.message).toList();
  }
}
