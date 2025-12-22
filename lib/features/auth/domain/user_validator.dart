import 'package:deehelp/core/domain/notification/domain_notification.dart';
import 'package:deehelp/core/domain/validation/validator.dart';
import 'package:deehelp/features/auth/domain/entity/user.dart';

import '../../../core/domain/validation/validation_handler.dart';

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
      user.email.notification,
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
