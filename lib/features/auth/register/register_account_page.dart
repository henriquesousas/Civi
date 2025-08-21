import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/auth/register/components/form_contact_info.dart';
import 'package:yousafe/features/auth/register/components/form_personal_info.dart';
import 'package:yousafe/features/auth/register/components/form_security_info.dart';
import 'package:yousafe/features/auth/register/components/register_account_progress_indicator.dart';
import 'package:yousafe/shared/animation/slide_fade_transition_animator.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/buttons/secondary_outline_button.dart';
import 'package:yousafe/shared/components/primary_app_bar.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';

import '../../../app/theme/app_colors.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({super.key});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final PageController _pageController = PageController();
  final int _totalStep = 3;
  int _currentStep = 0;

  void _previousStep() {
    setState(() {
      _currentStep--;
    });
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextStep() {
    if (_currentStep == _totalStep - 1) {
      context.push(Routes.otpVerification);
      return;
    }

    setState(() {
      _currentStep++;
    });

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PrimaryAppBar(title: context.strings.registerAccountAppbar),
      body: SafeArea(
        child: SlideFadeTransitionAnimator(
          delay: Duration(milliseconds: 100),
          child: Column(
            children: [
              RegisterAccountProgressIndicator(
                currentStep: _currentStep,
                totalStep: _totalStep,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    FormPersonalInfo(),
                    FormContactInfo(),
                    FormSecurityInfo(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: SecondaryOutlineButton(
                          text: context.strings.back,
                          onPressed: _previousStep,
                        ),
                      ),
                    Expanded(
                      child: PrimaryButton(
                        text: context.strings.next,
                        onPressed: _nextStep,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
