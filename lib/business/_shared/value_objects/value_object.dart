import 'package:deehelp/business/_shared/validation/notification_message.dart';
import 'package:equatable/equatable.dart';

import '../validation/domain_notification.dart';

abstract class ValueObject<T extends Object> extends Equatable {
  final T value;
  final _notification = DomainNotification();

  ValueObject(this.value) {
    validate(value);
  }

  void validate(T value);

  void addError(String field, String error) {
    _notification.append(field, error);
  }

  bool get hasError => _notification.hasErrors;

  List<NotificationMessage> get errors =>
      List.unmodifiable(_notification.getErrors);

  @override
  List<Object?> get props => [value];
}
