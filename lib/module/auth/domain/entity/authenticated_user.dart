enum AuthMethod {
  google,
  anonymous,
}

class AuthenticatedUser {
  final String id;
  final String name;
  final String email;
  final AuthMethod authMethod;
  final String? photoUrl;
  String? nickName;

  AuthenticatedUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.nickName,
    this.authMethod = AuthMethod.anonymous,
  });

  factory AuthenticatedUser.unauthenticated() {
    return AuthenticatedUser(
      id: 'anonymous',
      name: 'Anonymous',
      email: 'anonymous',
    );
  }

  void addNickName(String? nickname) {
    if (nickname != null) {
      nickName = nickname;
    }
  }
}
