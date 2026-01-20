import '../../../core/resources.dart';

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
        title: "[LABEL]",
        description: R.strings.onboardWelcomeDescription,
        lottieAsset: R.lottie.map,
      ),
      OnboardItem(
        title: R.strings.quickHelp,
        description: R.strings.onboardQuickHelpDescription,
        lottieAsset: R.lottie.warning,
      ),
      OnboardItem(
        title: R.strings.alets,
        description: R.strings.onboardAlertsDescription,
        lottieAsset: R.lottie.alerts,
      ),
      OnboardItem(
        title: R.strings.security,
        description: R.strings.onboardSecurityDescription,
        lottieAsset: R.lottie.secutiry,
      ),
    ];
  }
}
