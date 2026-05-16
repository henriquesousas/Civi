//TODO: remover
import 'package:equatable/equatable.dart';

enum AuthMethod {
  google,
  anonymous,
}

class LoggedUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  //TODO: Remover estes campos
  final AuthMethod authMethod;
  String? nickName;

  LoggedUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.nickName,
    this.authMethod = AuthMethod.anonymous,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email];

  // factory LoggedUser.create(Map<String, dynamic>? data) {
  //   return LoggedUser(
  //     id: user.id,
  //     email: user.email ?? '',
  //     name: data['name'] as String? ?? '',
  //     photoUrl: data['avatar_url'] as String?,
  //   );
  // }
}
