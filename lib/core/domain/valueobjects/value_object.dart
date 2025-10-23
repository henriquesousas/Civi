import 'package:equatable/equatable.dart';

import '../notification/domain_notification.dart';

abstract class ValueObject<T> extends Equatable {
  late final DomainNotification notification;

  ValueObject() : notification = DomainNotification() {
    validate(value);
  }

  T get value;

  void validate(T value);
}
