import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/onboarding/components/onboarding_bottom_section.dart';
import 'package:yousafe/features/onboarding/components/onboarding_content.dart';
import 'package:yousafe/features/onboarding/components/skip_button.dart';
import 'package:yousafe/features/onboarding/onboarding_item.dart';
import 'package:yousafe/shared/components/pageview/page_view_builder.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';

import '../../app/theme/app_colors.dart';

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

    context.push(Routes.login);
  }

  void _onPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onSkip() {
    context.push(Routes.login);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localization = context.strings;

    items = [
      OnboardingItem(
        title: localization.onboardingTitleOne,
        description: localization.onboardingDescriptionOne,
        icon: Icons.waving_hand_rounded,
        gradient: AppColors.primaryGradient,
        lottieAsset: null, // You can add Lottie animations here
      ),
      OnboardingItem(
        title: localization.onboardingTitleTwo,
        description: localization.onboardingDescriptionOne,
        icon: Icons.directions_car_rounded,
        gradient: AppColors.secondaryGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: localization.onboardingTitleThree,
        description: localization.onboardingDescriptionThree,
        icon: Icons.location_on_rounded,
        gradient: AppColors.accentGradient,
        lottieAsset: null,
      ),
      OnboardingItem(
        title: localization.onboardingTitleFour,
        description: localization.onboardingDescriptionFour,
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
