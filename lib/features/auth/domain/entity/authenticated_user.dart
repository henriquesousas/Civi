class AuthenticatedUser {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  String? nickName;

  AuthenticatedUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.nickName,
  });

  void addNickName(String? nickname) {
    if (nickname != null) {
      nickName = nickname;
    }
  }
}
