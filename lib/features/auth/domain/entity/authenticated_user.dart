class AuthenticatedUser {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String? nickName;

  AuthenticatedUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.nickName,
  });
}
