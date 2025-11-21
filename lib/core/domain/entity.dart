import 'package:deehelp/core/domain/notification/domain_notification.dart';
import 'package:deehelp/core/domain/validation/validation_handler.dart';
import 'package:deehelp/core/domain/valueobject/identifier.dart';
import 'package:equatable/equatable.dart';

abstract class Entity<ID extends Identifier> extends Equatable {
  final ID id;
  final notification = DomainNotification();

  Entity(this.id);

  void validate(ValidationHandler handler);

  @override
  List<Object?> get props => [id, notification];
}
