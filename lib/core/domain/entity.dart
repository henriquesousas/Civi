import 'package:equatable/equatable.dart';
import 'package:yousafe/core/domain/notification/domain_notification.dart';
import 'package:yousafe/core/domain/validation/validation_handler.dart';
import 'package:yousafe/core/domain/valueobjects/identifier.dart';

abstract class Entity<ID extends Identifier> extends Equatable {
  final ID id;
  final notification = DomainNotification();

  Entity(this.id);

  void validate(ValidationHandler handler);

  @override
  List<Object?> get props => [id];
}
