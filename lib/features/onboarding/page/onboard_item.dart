import '../../../core/ui/assets/resources.dart';

class OnboardItem {
  final String title;
  final String description;
  final String? lottieAsset;

  const OnboardItem({
    required this.title,
    required this.description,
    required this.lottieAsset,
  });

  static List<OnboardItem> pages() {
    return [
      OnboardItem(
        title: R.strings.welcome,
        description: R.strings.onboardWelcomeDescription,
        lottieAsset: "assets/lottie/map.json",
      ),
      OnboardItem(
        title: R.strings.quickHelp,
        description: R.strings.onboardQuickHelpDescription,
        lottieAsset: "assets/lottie/warning.json",
      ),
      OnboardItem(
        title: R.strings.alets,
        description: R.strings.onboardAlertsDescription,
        lottieAsset: "assets/lottie/chatting.json",
      ),
      OnboardItem(
        title: R.strings.security,
        description: R.strings.onboardSecurityDescription,
        lottieAsset: "assets/lottie/security.json",
      ),
    ];
  }
}
