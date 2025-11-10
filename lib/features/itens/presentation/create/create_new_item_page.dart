import 'package:deehelp/core/components/buttons/ui_outline_button.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/presentation/components/form_step_detail.dart';
import 'package:deehelp/features/itens/presentation/components/form_step_photo.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/buttons/ui_primary_button.dart';
import '../../../../shared/components/progress_indicator/step_indicator.dart';
import '../components/form_step_choose_type.dart';
import '../components/form_step_obs.dart';
import 'bloc/item_event.dart';

class CreateNewItemPage extends StatefulWidget {
  const CreateNewItemPage({super.key});

  @override
  State<CreateNewItemPage> createState() => _CreateNewItemPageState();
}

class _CreateNewItemPageState extends State<CreateNewItemPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final List<String> _labels = [
    "Tipo",
    "Detalhes",
    "Observação",
    "Foto",
  ];

  @override
  void initState() {
    super.initState();
    context.read<CreateItemBloc>().add(LoadItemsEvent());
  }

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
    if (_currentStep == _labels.length - 1) {
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

  bool _isFormValidByStepIndex(ItemState state) {
    if (_currentStep == 0) {
      return state.isFormSelectItemTypeValid;
    }
    if (_currentStep == 1) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateItemBloc, ItemState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: const UIAppBar(
            title: "Novo item",
            showDefaultLeading: true,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              spacing: 10,
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: UIOutlineButton(
                      text: context.strings.back,
                      press: _previousStep,
                    ),
                  ),
                Expanded(
                  child: UIPrimaryButton(
                    text: context.strings.next,
                    press: _isFormValidByStepIndex(state) ? _nextStep : null,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: BlocConsumer<CreateItemBloc, ItemState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      StepIndicator(
                        step: _currentStep,
                        labels: _labels,
                      ),
                      Expanded(
                        child: FadeSlideTransitionAnimator(
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              FormStepChooseType(press: () => _nextStep()),
                              const FormStepDetail(),
                              const FormStepObs(),
                              const FormStepPhoto(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
