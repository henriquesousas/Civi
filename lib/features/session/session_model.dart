class SessionModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  SessionModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  // factory SessionModel.from({
  //   required String id,
  //   required String name,
  //   required String email,
  //   required String photoUrl,
  // }) {
  //   return UserSession(id: id, name: name, email: email, photoUrl: photoUrl);
  // }
}
