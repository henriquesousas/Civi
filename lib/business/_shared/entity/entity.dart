import 'package:deehelp/business/_shared/domain_notification.dart';
import 'package:deehelp/business/_shared/entity/unique_id.dart';
import 'package:deehelp/business/_shared/value_objects/value_object.dart';
import 'package:deehelp/core/validation/validation_handler.dart';

abstract class Entity {
  final id = UniqueId.unique();
  final notification = DomainNotification();

  void validate(ValidationHandler handler);

  void appendErrorIfNecessary(ValueObject value) {
    if (value.hasError) {
      notification.appendAll(value.errors);
    }
  }
}
