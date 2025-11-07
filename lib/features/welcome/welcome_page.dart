import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/welcome/components/welcome_card.dart';
import 'package:deehelp/features/welcome/welcome_feature.dart';
import 'package:deehelp/shared/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/shared/components/buttons/primary_button.dart';
import 'package:deehelp/shared/components/icons/primary_icon.dart';
import 'package:deehelp/shared/components/indicator/primary_progress_indicator.dart';
import 'package:deehelp/shared/components/pageview/page_view_builder.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors_v2.dart';
import '../../shared/components/buttons/secondary_outline_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late List<WelcomeFeature> _features;
  final int _totalPages = 3;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localization = context.strings;

    _features = [
      WelcomeFeature(
        icon: Icons.location_on_rounded,
        title: "Localização",
        description: localization.welcomeOnboardingDesc1,
        gradient: AppColorsV2.primaryGradient,
        actionText: 'Add Locations',
      ),
      WelcomeFeature(
        icon: Icons.inventory,
        title: "Registre seus Ítens",
        description: localization.welcomeOnboardingDesc2,
        gradient: AppColorsV2.secondaryGradient,
        actionText: 'Add Payment',
      ),
      WelcomeFeature(
        icon: Icons.star_rounded,
        title: "Lançamento",
        description: localization.welcomeOnboardingDesc3,
        gradient: AppColorsV2.accentGradient,
        actionText: 'Explore Features',
      ),
    ];
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    context.push(RouterConstant.bottomView);
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsV2.background,
      body: SafeArea(
        child: Stack(
          children: [
            // const ConfettiAnimation(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                spacing: 20,
                children: [
                  const SizedBox(height: 30),
                  const PrimaryIcon(
                    width: 80,
                    height: 80,
                    borderRadius: 50,
                    icon: Icon(
                      Icons.celebration_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Text(
                    "${context.strings.welcomeHeader} Paulo",
                    textAlign: TextAlign.center,
                    style: context.getTextStyle.medium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColorsV2.textPrimary,
                      // fontSize: context.responsiveText(0.08),
                    ),
                  ),
                  Text(
                    context.strings.welcomeAccountCreatedSuccess,
                    textAlign: TextAlign.center,
                    style: context.getTextStyle.smallMedium.copyWith(
                      height: 1.5,
                      color: AppColorsV2.textSecondary,
                    ),
                  ),
                  Expanded(
                    child: SlideFadeTransitionAnimator(
                      delay: const Duration(milliseconds: 300),
                      child: PageViewBuilder(
                        itemCount: _totalPages,
                        initialPage: _currentPage,
                        itemBuilder: (context, index, controller) {
                          _pageController = controller;
                          return WelcomeCard(feature: _features[index]);
                        },
                        onPageChanged: _onPageChanged,
                      ),
                    ),
                  ),
                  PrimaryProgressIndicator(
                    currentPage: _currentPage,
                    totalPage: _totalPages,
                    selectedColor: AppColorsV2.primary,
                    unselectedColor: AppColorsV2.border,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        if (_currentPage > 0)
                          Expanded(
                            child: SecondaryOutlineButton(
                              text: context.strings.back,
                              onPressed: _previousPage,
                            ),
                          ),
                        Expanded(
                          child: PrimaryButton(
                            text: context.strings.next,
                            onPressed: _nextPage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
