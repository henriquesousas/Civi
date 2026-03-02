import 'package:equatable/equatable.dart';

class NotificationMessage extends Equatable {
  final String property;
  final String message;

  const NotificationMessage({required this.property, required this.message});

  @override
  List<Object?> get props => [property, message];
}
