import '../../../core/resources/resources.dart';

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
        title: R.strings.onboardingWelcomeHead,
        description: R.strings.onboardingWelcomeBody,
        lottieAsset: "assets/lottie/map.json",
      ),
      OnboardItem(
        title: R.strings.onboardingHelpHead,
        description: R.strings.onboardingHelpBody,
        lottieAsset: "assets/lottie/warning.json",
      ),
      OnboardItem(
        title: R.strings.onboardingAlertsRealTimeHead,
        description: R.strings.onboardingAlertsRealTimeBody,
        lottieAsset: "assets/lottie/chatting.json",
      ),
      OnboardItem(
        title: R.strings.onboardingSecurityHead,
        description: R.strings.onboardingSecurityBody,
        lottieAsset: "assets/lottie/security.json",
      ),
    ];
  }
}
