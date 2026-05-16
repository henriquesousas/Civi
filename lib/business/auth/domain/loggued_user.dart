import 'package:equatable/equatable.dart';

class LogguedUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  const LogguedUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [id, name, email];
}
