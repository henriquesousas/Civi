import 'package:deehelp/business/_shared/value_objects/exports.dart';
import 'package:deehelp/business/user/user.dart';
import 'package:deehelp/core/validation/validator.dart';

import '../../../core/validation/validation_handler.dart';

class UserValidator extends Validator {
  final User user;
  UserValidator({
    required this.user,
    required ValidationHandler handler,
  }) : super(handler: handler);

  @override
  void validate() {
    final List<ValueObject?> values = [
      user.name,
      user.email,
      user.nickname,
      user.phone,
      user.photo,
      user.bio
    ];

    values.forEach((element) => _copyIfHasError(element));
  }

  void _copyIfHasError(final ValueObject? value) {
    if (value == null) return;
    if (value.hasError) {
      handler.appendAll(value.errors);
    }
  }
}
