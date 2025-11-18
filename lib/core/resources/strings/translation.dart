abstract class Translation with TranslationParts {
  String get appName;
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
  String get obs;
  String get cancelRegister;
  String get cancelRegisterMessage;
  String get addPhoto;
  String get confirm;
  String get next;
  String get goAhead;
  String get defaultMessageError;
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
  String get myProducts;
  String get lastOccurrences;
  String get favorites;
  String get search;
  // BottomBar
  String get bottomBarProfile;
  String get bottomBarMyItems;
  String get bottomBarHome;
  // Logout
  String get logoutConfirmButton;
  String get logoutExitMessage;
  String get logoutExitTitle;

  // Items
  String get appNewItemTitle;
  String get addNewItem;
  String get stepOneHeader;
  String get stepOneBody;
  String get stepItemDetailHeader;
  String get stepItemDetailBody;
  String get errorMessageVehicle;
  String get hintTextVehicleCode;
  String get selectColor;
  String get selectBrand;
  String get stepObsHeady;
  String get stepObsBody;
  String get stepAddPhotoHead;
  String get stepAddPhotoBody;
  String get stepSummaryHead;
  String get stepSummaryBody;
  String get itemRegisterSuccessMessage;
  String get itemRegisterReceiver;
  List<String> get itemSteps;
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
