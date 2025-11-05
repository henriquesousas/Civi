import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/features/onboarding/components/onboarding_bottom_section.dart';
import 'package:deehelp/features/onboarding/components/onboarding_content.dart';
import 'package:deehelp/features/onboarding/components/skip_button.dart';
import 'package:deehelp/features/onboarding/onboarding_item.dart';
import 'package:deehelp/shared/components/pageview/page_view_builder.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../core/resources/resources.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  List<OnboardingItem> items = [];
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onNextPage() {
    if (_currentPage < items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    context.pushReplacement(Routes.loginWithGoogle);
  }

  void _onPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onSkip() {
    context.push(Routes.loginWithGoogle);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    items = [
      OnboardingItem(
        title: R.strings.onboardingWelcomeHead,
        description: R.strings.onboardingWelcomeBody,
        icon: Icons.waving_hand_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingHelpHead,
        description: R.strings.onboardingHelpBody,
        icon: Icons.directions_car_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingAlertsRealTimeHead,
        description: R.strings.onboardingAlertsRealTimeBody,
        icon: Icons.location_on_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: R.strings.onboardingSecurityHead,
        description: R.strings.onboardingSecurityBody,
        icon: Icons.security_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null,
      ),
    ];
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
              itemCount: items.length,
              initialPage: 0,
              itemBuilder: (context, index, controller) {
                pageController = controller;
                final page = items[index];
                return OnboardingContent(page: page);
              },
            ),
            SkipButton(
              onSkip: _onSkip,
            ),
            OnboardingBottomSection(
              currentPage: _currentPage,
              totalPage: items.length,
              buttonTitle: _currentPage == items.length - 1
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
