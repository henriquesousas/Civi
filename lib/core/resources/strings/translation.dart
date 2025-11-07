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
  String get skip;
  String get version;
  String get waiting;

  // Login
  String get loginInfo;
  String get enterCreateAccount;
  String get continueWithoutLogin;
  String get loginInvalidCredentialsError;
  String get loginWithGoogleError;

  //Onboarding
  String get onboardingWelcomeHead;
  String get onboardingWelcomeBody;
  String get onboardingHelpHead;
  String get onboardingHelpBody;
  String get onboardingAlertsRealTimeHead;
  String get onboardingAlertsRealTimeBody;
  String get onboardingSecurityHead;
  String get onboardingSecurityBody;

  //Splash
  String get splashHeadline;

  // Profile
  String get preferences;
  String get sharedAndSupport;
  String get exitApp;
  String get faq;
  String get help;
  String get myItems;
  String get lastOccurrences;
  String get favorites;
  String get search;
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
