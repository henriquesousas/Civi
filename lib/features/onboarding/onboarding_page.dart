import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/onboarding/components/onboarding_bottom_section.dart';
import 'package:deehelp/features/onboarding/components/onboarding_content.dart';
import 'package:deehelp/features/onboarding/components/skip_button.dart';
import 'package:deehelp/features/onboarding/onboarding_item.dart';
import 'package:deehelp/shared/components/pageview/page_view_builder.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  // List<OnboardingItem> items = [];
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onNextPage() {
    if (_currentPage < OnboardingItem.pages().length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    context.pushReplacement(RouterConstant.loginWithGoogle);
  }

  void _onPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onSkip() {
    context.push(RouterConstant.loginWithGoogle);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // items = [
    //   OnboardingItem(
    //     title: R.strings.onboardingWelcomeHead,
    //     description: R.strings.onboardingWelcomeBody,
    //     icon: Icons.waving_hand_rounded,
    //     gradient: AppColorsV2.primaryGradient,
    //     lottieAsset: null,
    //   ),
    //   OnboardingItem(
    //     title: R.strings.onboardingHelpHead,
    //     description: R.strings.onboardingHelpBody,
    //     icon: Icons.directions_car_rounded,
    //     gradient: AppColorsV2.primaryGradient,
    //     lottieAsset: null,
    //   ),
    //   OnboardingItem(
    //     title: R.strings.onboardingAlertsRealTimeHead,
    //     description: R.strings.onboardingAlertsRealTimeBody,
    //     icon: Icons.location_on_rounded,
    //     gradient: AppColorsV2.primaryGradient,
    //     lottieAsset: null,
    //   ),
    //   OnboardingItem(
    //     title: R.strings.onboardingSecurityHead,
    //     description: R.strings.onboardingSecurityBody,
    //     icon: Icons.security_rounded,
    //     gradient: AppColorsV2.primaryGradient,
    //     lottieAsset: null,
    //   ),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            PageViewBuilder(
              onPageChanged: _onPageChanged,
              itemCount: OnboardingItem.pages().length,
              initialPage: 0,
              itemBuilder: (context, index, controller) {
                pageController = controller;
                final page = OnboardingItem.pages()[index];
                return OnboardingContent(page: page);
              },
            ),
            SkipButton(onSkip: _onSkip),
            OnboardingBottomSection(
              currentPage: _currentPage,
              totalPage: OnboardingItem.pages().length,
              buttonTitle: _currentPage == OnboardingItem.pages().length - 1
                  ? context.strings.start
                  : context.strings.next,
              onNext: _onNextPage,
              onPrevious: _onPreviousPage,
            ),
          ],
        ),
      ),
    );
  }
}
