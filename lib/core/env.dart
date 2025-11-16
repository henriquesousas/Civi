class Env {
  static const Map<String, String> _keys = {
    "R2_BASE_URL": String.fromEnvironment("R2_BASE_URL"),
    "R2_ACCOUNT_ID": String.fromEnvironment("R2_ACCOUNT_ID"),
    "R2_ACCESS_KEY_ID": String.fromEnvironment("R2_ACCESS_KEY_ID"),
    "R2_SECRET_ACCESS_KEY_ID":
        String.fromEnvironment("R2_SECRET_ACCESS_KEY_ID"),
  };

  static String _getKey(String key) {
    final value = _keys[key] ?? '';
    if (value.isEmpty) {
      throw Exception('$key is not set in Env');
    }
    return value;
  }

  static String get r2BaseUrl =>
      "https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev"; // _getKey("R2_BASE_URL");
  static String get r2AccountId =>
      "2f0c45d371a6f728da6a889027b991f5"; // _getKey("R2_ACCOUNT_ID");
  static String get r2AccessKeyId =>
      "290d6a3180cc5b6fa78937b557bda224"; //_getKey("R2_ACCESS_KEY_ID");
  static String get r2SecretAccessKeyId =>
      "6fd0a3d0bbaa58909b0a8739d70dda002d709dc19ef9a237ac1473a29eba0312"; // _getKey("R2_SECRET_ACCESS_KEY_ID");
}
