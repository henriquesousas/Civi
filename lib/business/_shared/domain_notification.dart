import 'package:deehelp/core/validation/validation_handler.dart';

import '../../core/notification/notification_message.dart';

class DomainNotification implements ValidationHandler {
  final Set<NotificationMessage> _notifications = {};
  List<NotificationMessage> get notifications => _notifications.toList();

  bool get hasErrors => _notifications.isNotEmpty;

  bool get isValid => !hasErrors;

  @override
  DomainNotification append(String property, String message) {
    _notifications
        .add(NotificationMessage(property: property, message: message));
    return this;
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

  void clear() {
    _notifications.clear();
  }

  List<NotificationMessage> get getErrors {
    return _notifications.map((n) => n).toList();
  }
}
