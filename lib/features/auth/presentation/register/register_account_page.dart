import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/shared/animation/slide_fade_transition_animator.dart';
import 'package:deehelp/shared/components/buttons/primary_button.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors_v2.dart';
import '../../../../shared/components/buttons/secondary_outline_button.dart';
import '../../../../shared/components/progress_indicator/step_indicator.dart';
import 'components/form_contact_info.dart';
import 'components/form_personal_info.dart';
import 'components/form_security_info.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({super.key});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final PageController _pageController = PageController();
  final int _totalStep = 3;
  int _currentStep = 0;

  final List<String> _titles = [
    "Dados pessoais",
    "Contato",
    "Segurança",
  ];

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
      context.push(RouterConstant.otpVerification);
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
      backgroundColor: AppColorsV2.background,
      appBar: UIAppBar(title: context.strings.registerAccountAppbar),
      body: SafeArea(
        child: SlideFadeTransitionAnimator(
          delay: const Duration(milliseconds: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: StepIndicator(
                  currentStep: _currentStep,
                  titles: _titles,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
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
