abstract class Translation with TranslationParts {
  String get welcome;
  String get email;
  String get password;
  String get forgotPassword;
  String get enter;
  String get enterWithGoogle;
  String get or;
  String get notHaveAccount;
  String get warning;

  // Login
  String get loginInfo;
}

mixin TranslationParts {
  List<String> parts({
    required String text,
    int expectedParts = 2,
  }) {
    final parts = text.split("|");

    while (parts.length < expectedParts) {
      parts.add("");
    }

    return parts.sublist(0, expectedParts).map((p) => p.trim()).toList();
  }
}
