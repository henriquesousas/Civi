import 'package:flutter/material.dart';
import 'package:yousafe/features/itens/create/components/form_step_detail.dart';
import 'package:yousafe/features/itens/create/components/form_step_photo.dart';
import 'package:yousafe/shared/animation/fade_slide_transition_animator.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/primary_app_bar.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';

import '../../../shared/components/buttons/secondary_outline_button.dart';
import '../../../shared/components/progress_indicator/step_indicator.dart';
import 'components/form_step_choose_type.dart';
import 'components/form_step_obs.dart';

class CreateNewItemPage extends StatefulWidget {
  const CreateNewItemPage({super.key});

  @override
  State<CreateNewItemPage> createState() => _CreateNewItemPageState();
}

class _CreateNewItemPageState extends State<CreateNewItemPage> {
  final PageController _pageController = PageController();
  // final int _totalStep = 3;
  int _currentStep = 0;
  final List<String> _titles = [
    "Tipo",
    "Detalhes",
    "Observação",
    "Foto",
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
    if (_currentStep == _titles.length - 1) {
      // context.push(Routes.otpVerification);
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
      appBar: const PrimaryAppBar(title: "Novo item"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          spacing: 10,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              StepIndicator(
                currentStep: _currentStep,
                titles: _titles,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: FadeSlideTransitionAnimator(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      FormStepChooseType(),
                      FormStepDetail(),
                      FormStepObs(),
                      FormStepPhoto(),
                    ],
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
