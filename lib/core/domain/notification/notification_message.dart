import 'package:equatable/equatable.dart';

class NotificationMessage extends Equatable {
  final String property;
  final String message;

  const NotificationMessage({required this.property, required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationMessage &&
        other.property == property &&
        other.message == message;
  }

  @override
  List<Object?> get props => [property, message];

  @override
  int get hashCode => property.hashCode;
}
