import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/features/my_products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/my_products/view/create/state/create_product_state.dart';
import 'package:deehelp/features/my_products/view/create/steps/step_add_photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/dimens.dart';
import '../../../../../core/widgets/buttons/ui_elevated_button.dart';
import 'step_add_info_detal.dart';
import 'step_add_obs.dart';

class CreateProductSteps extends StatefulWidget {
  const CreateProductSteps({super.key});

  @override
  State<CreateProductSteps> createState() => _CreateProductStepsState();
}

class _CreateProductStepsState extends State<CreateProductSteps> {
  List<Step> _steps = [];
  // int _currentStep = 0;

  void _buildSteps(int currentStep) {
    _steps = [
      Step(
        title: Text(
          "Detalhes do veículo",
          style: context.appTextStyles.bodyTextStyle1,
        ),
        content: const StepAddInfoDetail(),
        isActive: currentStep == 0,
      ),
      Step(
        title: Text("Observação", style: context.appTextStyles.bodyTextStyle1),
        content: const StepAddObs(),
        isActive: currentStep == 1,
      ),
      Step(
        title: Text("Foto", style: context.appTextStyles.bodyTextStyle1),
        content: const StepAddPhoto(),
        isActive: currentStep == 2,
      ),
    ];
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _steps = _buildSteps();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<CreateProductCubit, CreateProductState>(
          listener: (context, state) {
            state.maybeMap(
              data: (state) {
                // setState(() {
                //   _currentStep = state.currentStep;
                // });
              },
              orElse: () => 0,
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              data: (state) {
                _buildSteps(state.currentStep);
                return Expanded(
                  child: Stepper(
                    connectorColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors.primaryColor;
                      }
                      if (states.contains(WidgetState.disabled)) {
                        return AppColors.primaryColor.withValues(alpha: 0.5);
                      }
                      return AppColors.errorColor;
                    }),
                    onStepCancel: () => {
                      // if (controller.currentStep > 0) {
                      //   controller.setCurrentStep(
                      //     controller.currentStep - 1,
                      //     steps.length,
                      //   );
                      // }
                    },
                    controlsBuilder: (context, details) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            if (state.currentStep > 0)
                              if (true)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 16,
                                    ),
                                    child: UIElevatedButton(
                                      radius: Dimens.defaultRadius,
                                      borderColor: AppColors.lightGreyColor20,
                                      bgColor: AppColors.whiteColor,
                                      textColor: AppColors.textColorBody,
                                      text: "Voltar",
                                      press: () => context
                                          .read<CreateProductCubit>()
                                          .previous(details.currentStep),
                                    ),
                                  ),
                                ),
                            Expanded(
                              child: UIElevatedButton(
                                radius: Dimens.defaultRadius,
                                bgColor: AppColors.primaryColor,
                                text: "Próximo",
                                // text: controller.currentStep == steps.length - 1
                                //     ? MyStrings.confirm
                                //     : MyStrings.next,
                                // isLoading: controller.currentStep == steps.length - 1
                                //     ? controller.isCardCreateLoadings
                                //     : false,
                                isLoading: false,
                                isEnabled: true,
                                // press: details.onStepContinue ?? () {},
                                press: () => context
                                    .read<CreateProductCubit>()
                                    .nextStep(details.currentStep),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    type: StepperType.vertical,
                    currentStep: state.currentStep.clamp(0, _steps.length - 1),
                    onStepTapped: (value) {},
                    steps: _steps,
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        )
      ],
    );
  }
}
