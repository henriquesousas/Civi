abstract interface class UserDataSource {
  Future<Map<String, dynamic>> getProfile(String userId);
}
