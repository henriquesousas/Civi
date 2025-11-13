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

  static String get clAccountId => _getKey("ACCOUNT_ID");
  static String get clAccessKeyId => _getKey("ACCESS_KEY_ID");
  static String get clSecretAccessKeyId => _getKey("SECRET_ACCESS_KEY_ID");
}
