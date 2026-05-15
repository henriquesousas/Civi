import '../../business/_shared/domain_notification.dart';
import '../notification/notification_message.dart';

abstract class ValidationHandler {
  ValidationHandler append(String property, String message);
  ValidationHandler appendAll(List<NotificationMessage> notifications);
  void copy(DomainNotification notification);
}
