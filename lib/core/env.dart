class Env {
  static const Map<String, String> _keys = {
    "ACCOUNT_ID": String.fromEnvironment("ACCOUNT_ID"),
    "ACCESS_KEY_ID": String.fromEnvironment("ACCESS_KEY_ID"),
    "SECRET_ACCESS_KEY_ID": String.fromEnvironment("SECRET_ACCESS_KEY_ID"),
  };

  static String _getKey(String key) {
    final value = _keys[key] ?? '';
    if (value.isEmpty) {
      throw Exception('$key is not set in Env');
    }
    return value;
  }

  static String get r2AccountId =>
      "2f0c45d371a6f728da6a889027b991f5"; // _getKey("ACCOUNT_ID");
  static String get r2AccessKeyId =>
      "290d6a3180cc5b6fa78937b557bda224"; //_getKey("ACCESS_KEY_ID");
  static String get r2SecretAccessKeyId =>
      "6fd0a3d0bbaa58909b0a8739d70dda002d709dc19ef9a237ac1473a29eba0312"; // _getKey("SECRET_ACCESS_KEY_ID");
}
