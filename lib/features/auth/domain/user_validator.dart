import 'package:yousafe/core/domain/notification/domain_notification.dart';
import 'package:yousafe/core/domain/validator.dart';
import 'package:yousafe/features/auth/domain/user.dart';

import '../../../core/domain/validation_handler.dart';

class UserValidator extends Validator {
  final User user;

  UserValidator({
    required this.user,
    required ValidationHandler handler,
  }) : super(handler: handler);

  @override
  void validate() {
    final List<DomainNotification?> notifications = [
      user.id.notification,
      user.name.notification,
      user.surName.notification,
      user.password.notification,
      user.email.notification,
      user.phone.notification,
      user.photoUrl?.notification,
    ];

    notifications.forEach((notification) => copyIfHasError(notification));
  }

  void copyIfHasError(final DomainNotification? notification) {
    if (notification == null) return;
    if (notification.hasErrors) {
      handler.copy(notification);
    }
  }
}
