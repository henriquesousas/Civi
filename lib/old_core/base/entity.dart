import 'package:deehelp/business/_shared/validation/domain_notification.dart';
import 'package:deehelp/business/_shared/validation/validation_handler.dart';
import 'package:deehelp/old_core/valueobject/identifier.dart';
import 'package:equatable/equatable.dart';

abstract class Entity<ID extends Identifier> extends Equatable {
  final ID id;
  final notification = DomainNotification();

  Entity(this.id);

  void validate(ValidationHandler handler);

  @override
  List<Object?> get props => [id, notification];
}
