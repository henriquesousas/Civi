import 'package:flutter/material.dart';
import 'package:yousafe/features/onboarding/components/onboading_text_section.dart';
import 'package:yousafe/features/onboarding/components/onboarding_logo.dart';
import 'package:yousafe/features/onboarding/onboarding_item.dart';
import 'package:yousafe/shared/animation/slide_fade_animator.dart';

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
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: OnboardingLogo(icon: widget.page.icon),
              ),
              Expanded(
                flex: 2,
                child: SlideFadeAnimator(
                  duration: Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 200),
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
