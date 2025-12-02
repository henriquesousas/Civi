import 'package:deehelp/core/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/onboarding/components/onboading_text_section.dart';
import 'package:deehelp/features/onboarding/components/onboarding_logo.dart';
import 'package:deehelp/features/onboarding/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatefulWidget {
  final OnboardingItem page;
  const OnboardingContent({super.key, required this.page});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: widget.page.gradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(24),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: OnboardingLogo(
                    icon: Icon(
                  widget.page.icon,
                  color: AppColors.primaryColor,
                  size: context.responsiveRadius(0.1),
                )),
              ),
              Expanded(
                flex: 2,
                child: SlideFadeTransitionAnimator(
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 200),
                  child: OnboardingTextSection(
                    title: widget.page.title,
                    description: widget.page.description,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
