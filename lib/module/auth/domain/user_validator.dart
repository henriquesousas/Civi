import 'package:deehelp/business/_shared/validation/domain_notification.dart';
import 'package:deehelp/business/user/entities/user.dart';
import 'package:deehelp/old_core/validation/validator.dart';

import '../../../business/_shared/validation/validation_handler.dart';

class UserValidator extends Validator {
  UserValidator({
    required User user,
    required ValidationHandler handler,
  }) : super(handler: handler);

  @override
  void validate() {
    // final List<DomainNotification?> notifications = [
    //   user.id.notification,
    //   user.name.notification,
    //   user.email.notification,
    //   user.photoUrl?.notification,
    // ];
    // notifications.forEach((notification) => copyIfHasError(notification));
  }

  void copyIfHasError(final DomainNotification? notification) {
    if (notification == null) return;
    if (notification.hasErrors) {
      handler.copy(notification);
    }
  }
}
