import 'package:equatable/equatable.dart';

import '../../core/notification/domain_notification.dart';

abstract class ValueObject<T> extends Equatable {
  final T value;
  late final DomainNotification notification;

  ValueObject(this.value) : notification = DomainNotification() {
    validate(value);
  }

  void validate(T value);

  @override
  List<Object?> get props => [value];
}
