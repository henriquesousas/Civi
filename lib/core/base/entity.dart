import 'package:deehelp/business/_shared/domain_notification.dart';
import 'package:deehelp/core/validation/validation_handler.dart';
import 'package:deehelp/core/valueobject/identifier.dart';
import 'package:equatable/equatable.dart';

abstract class Entity<ID extends Identifier> extends Equatable {
  final ID id;
  final notification = DomainNotification();

  Entity(this.id);

  void validate(ValidationHandler handler);

  @override
  List<Object?> get props => [id, notification];
}
